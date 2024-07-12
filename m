Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C13C3DA4D
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jul 2024 15:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OodTBP0nMMJWpJ2KcfTbl+/g0Itytcy4W+SC+8lxWJc=; b=SMi4c11aU1G1Me+ATazRnHrOpE
	Na4YRQQQjsR2U9u/9uomhooIMvtjeavd9IpVx7kwA4iNQwfFofQVxLpAj3/ZbURNNffxjO1mTjI2w
	9K5iBhR7hST1hY69mkTPphmn6MRMrxr43WVapaluDGiI8rVRuQZC1iYRuAGy7DQ3fVyHedqiM/3jg
	aviwTlzs3pmCLCzne3lYF9abxR5buf1oErm2lU08gDmoKqwHb+IgLi62LoBpgDVu1yylghJ1xPCu4
	YasQq97hjTOBDP7cM2W4VSB4Zmoj2gJQy29OTzyEuh0zPouy+JL9C8gAOWWSQ+2fkcxn69m3bdEP3
	mnPmggnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSIGO-00000000XSC-0eUW;
	Fri, 12 Jul 2024 15:32:48 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSIGL-00000000XQg-0aC0
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Jul 2024 15:32:46 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-25cba5eea69so1011706fac.2
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Jul 2024 08:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720798363; x=1721403163; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OodTBP0nMMJWpJ2KcfTbl+/g0Itytcy4W+SC+8lxWJc=;
        b=IJoV+IPVPvIZAXUytXRX3Y0ZPwttVVmSMwQuQvNv1OgGs2mDHhuxP/NxT6TMTkNc1j
         F5/A9ypbd2zcA+IhlCETAidXwTmuQkhfR5zR5X2QNlVyZCpSMJ5eDBNP6PaDHH+Cc911
         0vdqSZiKj+m9SfpMaAu1Gm1SrII2U3EILQctmkk6G7q7arpl5nUbk4KIZ9A8N+CIJVFe
         I9y2X888ORa9vj15pcvkC5vj5FikqXjjW+V4C7LKym08AHcUYKhB5qo195IqfDu9dXpB
         pdb3h1IgWbPtAb0tggAz22kzGYV1bGL849MRDT+FpPxH7GB3LIXeO5t0ny7E9g9XcObM
         kkdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720798363; x=1721403163;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OodTBP0nMMJWpJ2KcfTbl+/g0Itytcy4W+SC+8lxWJc=;
        b=NlKMV22I8R+zVRsPpzKZV4YTQVdSA2/cpkqywMPP8bpbMbOEjTi9l14faCocRLShTa
         xKHVXK8O/ivykYomPz5Z765bAY0uqF9WilUcnPFnslrF6s+BEeyacESCxz98g+nhRWve
         rZfojAZWCEnGiPAmUzo0z8sAxJutPkny119rihaAokzl2gHWoliwODKuBTp1dZSKOVuK
         EZYsOSk7tfIvkfY6l/UWERLP/G1qyDU1LNe/WX3UkaR7exPAlfVanT1l+JkKKDc0qy8Z
         qWqJUGZYBYsVkPJXnACAmUYQFXsBDrTNcYeIZ4dbU7qCj1SNpAbxGYTCblODWN1MyxpW
         ZkCw==
X-Gm-Message-State: AOJu0Yzj0f9mtejX+fcIHKOa/819iFjXDQ9l+EVc0070U597fI/uR8os
	M8owGhQrxmtNgWk7k6l44CStXFH0avYrp6ciR0mU7ecGQWj9WceqLSZS8sDu9SOICFOcb+365xT
	Z
X-Google-Smtp-Source: AGHT+IEPfl5teaKfv7LhnI+j21/b6uf+zH5EfZzfcfpBdt72z6pfmlRepRcPmPUwPhgb6w6k9xLfeA==
X-Received: by 2002:a05:6870:9550:b0:254:948e:bf08 with SMTP id 586e51a60fabf-25eae8320eamr6676624fac.31.1720798363198;
        Fri, 12 Jul 2024 08:32:43 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:d26:9826:56eb:a2e5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25ea9f8ff5esm2265551fac.5.2024.07.12.08.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 08:32:42 -0700 (PDT)
Date: Fri, 12 Jul 2024 10:32:40 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sean Wang <sean.wang@mediatek.com>
Cc: linux-mediatek@lists.infradead.org
Subject: [bug report] wifi: mt76: mt7925: add mt7925_change_vif_links
Message-ID: <350c8f73-26a5-4337-9b92-a211d8362195@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240712_083245_251686_0C637A37 
X-CRM114-Status: UNSURE (   5.98  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello Sean Wang,

This is a semi-automatic email about new static checker warnings.

Commit 69acd6d910b0 ("wifi: mt76: mt7925: add
mt7925_change_vif_links") from Jul 6, 2024, leads to the following
Smatch complaint:

    drivers/net/wireless/mediatek/mt76/mt7925/mcu.c:1155 mt7925_mcu_set_mlo_roc()
    warn: variable dereferenced before check 'mconf' (see line 1127)

drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
  1126	{
  1127		struct mt792x_vif *mvif = mconf->vif;
                                          ^^^^^^^^^^
Dereference

  1128		struct ieee80211_vif *vif = container_of((void *)mvif,
  1129							 struct ieee80211_vif, drv_priv);
  1130		struct ieee80211_bss_conf *link_conf;
  1131		struct ieee80211_channel *chan;
  1132		const u8 ch_band[] = {
  1133			[NL80211_BAND_2GHZ] = 1,
  1134			[NL80211_BAND_5GHZ] = 2,
  1135			[NL80211_BAND_6GHZ] = 3,
  1136		};
  1137		enum mt7925_roc_req type;
  1138		int center_ch, i = 0;
  1139		bool is_AG_band = false;
  1140		struct {
  1141			u8 id;
  1142			u8 bss_idx;
  1143			u16 tag;
  1144			struct mt792x_bss_conf *mconf;
  1145			struct ieee80211_channel *chan;
  1146		} links[2];
  1147	
  1148		struct {
  1149			struct {
  1150				u8 rsv[4];
  1151			} __packed hdr;
  1152			struct roc_acquire_tlv roc[2];
  1153		} __packed req;
  1154	
  1155		if (!mconf || hweight16(vif->valid_links) < 2 ||
                     ^^^^^
Checked too late

  1156		    hweight16(sel_links) != 2)
  1157			return -EPERM;

regards,
dan carpenter

