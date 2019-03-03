From: "Gustavo A. R. Silva" <gustavo-L1vi/lXTdts+Va1GwOuvDg@public.gmane.org>
Subject: Re: [mt76/mt7603/mac] Question about missing variable assignment
Date: Sun, 3 Mar 2019 09:06:44 -0600
Message-ID: <861395c6-e172-14f6-7bc1-ebd6368746f1@embeddedor.com>
References: <20190302211046.GA20268@embeddedor.com>
 <827d2ee6-04de-f4f9-15b4-40dac90bda9c@nbd.name>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <827d2ee6-04de-f4f9-15b4-40dac90bda9c-Vt+b4OUoWG0@public.gmane.org>
Content-Language: en-US
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org



On 3/3/19 4:05 AM, Felix Fietkau wrote:
> On 2019-03-02 22:10, Gustavo A. R. Silva wrote:
>> Hi all,
>>
>> The following piece of code in drivers/net/wireless/mediatek/mt76/mt7603/mac.c
>> is missing a variable assignment before line 1058.  Notice that there
>> is a potential execution path in which variable *i* is compared against
>> magic number 15 at line 1075 without being initialized previously
>> (this was reported by Coverity):
>>
>> 1055 out:
>> 1056         final_rate_flags = info->status.rates[final_idx].flags;
>> 1057 
>> 1058         switch (FIELD_GET(MT_TX_RATE_MODE, final_rate)) {
>> 1059         case MT_PHY_TYPE_CCK:
>> 1060                 cck = true;
>> 1061                 /* fall through */
>> 1062         case MT_PHY_TYPE_OFDM:
>> 1063                 if (dev->mt76.chandef.chan->band == NL80211_BAND_5GHZ)
>> 1064                         sband = &dev->mt76.sband_5g.sband;
>> 1065                 else
>> 1066                         sband = &dev->mt76.sband_2g.sband;
>> 1067                 final_rate &= GENMASK(5, 0);
>> 1068                 final_rate = mt7603_get_rate(dev, sband, final_rate, cck);
>> 1069                 final_rate_flags = 0;
>> 1070                 break;
>> 1071         case MT_PHY_TYPE_HT_GF:
>> 1072         case MT_PHY_TYPE_HT:
>> 1073                 final_rate_flags |= IEEE80211_TX_RC_MCS;
>> 1074                 final_rate &= GENMASK(5, 0);
>> 1075                 if (i > 15)
>> 1076                         return false;
>> 1077                 break;
>> 1078         default:
>> 1079                 return false;
>> 1080         }
>>
>> My guess is that such missing assignment should be something similar
>> to the one at line 566:
>>
>> 	i = FIELD_GET(MT_RXV1_TX_RATE, rxdg0);
>>
>> but I'm not sure what the proper arguments for macro FIELD_GET should
>> be.
>>
>> This code was introduced by commit c8846e1015022d2531ac4c895783e400b3e5babe
>>
>> What do you think?
> Thanks for reporting this. The fix is simpler than that, the check
> should be: if (final_rate > 15)
> I will send a fix.
> 

Great. Glad to help. :)

Thanks
--
Gustavo
