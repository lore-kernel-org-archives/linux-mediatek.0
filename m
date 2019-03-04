From: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: [bug report] mt76: add driver for MT7603E and MT7628/7688
Date: Mon, 4 Mar 2019 23:03:44 +0300
Message-ID: <20190304200344.GA14085@kadam>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: nbd-Vt+b4OUoWG0@public.gmane.org
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Hello Felix Fietkau,

The patch c8846e101502: "mt76: add driver for MT7603E and
MT7628/7688" from Nov 6, 2018, leads to the following static checker
warning:

	drivers/net/wireless/mediatek/mt76/mt7603/mac.c:1075 mt7603_fill_txs()
	error: uninitialized symbol 'i'.

drivers/net/wireless/mediatek/mt76/mt7603/mac.c
    976 static bool
    977 mt7603_fill_txs(struct mt7603_dev *dev, struct mt7603_sta *sta,
    978 		struct ieee80211_tx_info *info, __le32 *txs_data)
    979 {
    980 	struct ieee80211_supported_band *sband;
    981 	int final_idx = 0;
    982 	u32 final_rate;
    983 	u32 final_rate_flags;
    984 	bool final_mpdu;
    985 	bool ack_timeout;
    986 	bool fixed_rate;
    987 	bool probe;
    988 	bool ampdu;
    989 	bool cck = false;
    990 	int count;
    991 	u32 txs;
    992 	u8 pid;
    993 	int idx;
    994 	int i;
                ^^^^^

    995 
    996 	fixed_rate = info->status.rates[0].count;
    997 	probe = !!(info->flags & IEEE80211_TX_CTL_RATE_CTRL_PROBE);
    998 
    999 	txs = le32_to_cpu(txs_data[4]);
    1000 	final_mpdu = txs & MT_TXS4_ACKED_MPDU;
    1001 	ampdu = !fixed_rate && (txs & MT_TXS4_AMPDU);
    1002 	pid = FIELD_GET(MT_TXS4_PID, txs);
    1003 	count = FIELD_GET(MT_TXS4_TX_COUNT, txs);
    1004 
    1005 	txs = le32_to_cpu(txs_data[0]);
    1006 	final_rate = FIELD_GET(MT_TXS0_TX_RATE, txs);
    1007 	ack_timeout = txs & MT_TXS0_ACK_TIMEOUT;
    1008 
    1009 	if (!ampdu && (txs & MT_TXS0_RTS_TIMEOUT))
    1010 		return false;
    1011 
    1012 	if (txs & MT_TXS0_QUEUE_TIMEOUT)
    1013 		return false;
    1014 
    1015 	if (!ack_timeout)
    1016 		info->flags |= IEEE80211_TX_STAT_ACK;
    1017 
    1018 	info->status.ampdu_len = 1;
    1019 	info->status.ampdu_ack_len = !!(info->flags &
    1020 					IEEE80211_TX_STAT_ACK);
    1021 
    1022 	if (ampdu || (info->flags & IEEE80211_TX_CTL_AMPDU))
    1023 		info->flags |= IEEE80211_TX_STAT_AMPDU | IEEE80211_TX_CTL_AMPDU;
    1024 
    1025 	if (fixed_rate && !probe) {
    1026 		info->status.rates[0].count = count;
    1027 		goto out;
                        ^^^^^^^^

    1028 	}
    1029 
    1030 	for (i = 0, idx = 0; i < ARRAY_SIZE(info->status.rates); i++) {
    1031 		int cur_count = min_t(int, count, 2 * MT7603_RATE_RETRY);
    1032 
    1033 		if (!i && probe) {
    1034 			cur_count = 1;
    1035 		} else {
    1036 			info->status.rates[i] = sta->rates[idx];
    1037 			idx++;
    1038 		}
    1039 
    1040 		if (i && info->status.rates[i].idx < 0) {
    1041 			info->status.rates[i - 1].count += count;
    1042 			break;
    1043 		}
    1044 
    1045 		if (!count) {
    1046 			info->status.rates[i].idx = -1;
    1047 			break;
    1048 		}
    1049 
    1050 		info->status.rates[i].count = cur_count;
    1051 		final_idx = i;
    1052 		count -= cur_count;
    1053 	}
    1054 
    1055 out:
    1056 	final_rate_flags = info->status.rates[final_idx].flags;
    1057 
    1058 	switch (FIELD_GET(MT_TX_RATE_MODE, final_rate)) {
    1059 	case MT_PHY_TYPE_CCK:
    1060 		cck = true;
    1061 		/* fall through */
    1062 	case MT_PHY_TYPE_OFDM:
    1063 		if (dev->mt76.chandef.chan->band == NL80211_BAND_5GHZ)
    1064 			sband = &dev->mt76.sband_5g.sband;
    1065 		else
    1066 			sband = &dev->mt76.sband_2g.sband;
    1067 		final_rate &= GENMASK(5, 0);
    1068 		final_rate = mt7603_get_rate(dev, sband, final_rate, cck);
    1069 		final_rate_flags = 0;
    1070 		break;
    1071 	case MT_PHY_TYPE_HT_GF:
    1072 	case MT_PHY_TYPE_HT:
    1073 		final_rate_flags |= IEEE80211_TX_RC_MCS;
    1074 		final_rate &= GENMASK(5, 0);
--> 1075 		if (i > 15)
                            ^^^^^^

    1076 			return false;
    1077 		break;
    1078 	default:
    1079 		return false;
    1080 	}
    1081 
    1082 	info->status.rates[final_idx].idx = final_rate;
    1083 	info->status.rates[final_idx].flags = final_rate_flags;
    1084 
    1085 	return true;
    1086 }

regards,
dan carpenter
