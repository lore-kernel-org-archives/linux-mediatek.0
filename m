Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1EBBC36002
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Mar 2025 14:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tUD2C4napqD5vuJG3mWPuzbrUFJy02UiM24OoqoE4Pw=; b=rmADAv0tnNDIK932iX2u0HdK55
	MPtEoy+Zv1G+oDii07q3TGA5dfpTYo8lKzOTD0VX30Dhd/rtpzRYAODUQwADURTW5lBbFif8oXRWe
	WjsycGuyyNGyWJWE9L2mKgFSRvJHQnJHAJBWCGSW3+hwPtjk86D7pJHo29T3JVqjHiTwFaq5Xqwuw
	1hv1j/eSS/3vHUMqlR6pAuu8aOQQ8e7S23zo96/nc5HSwNa0YX/sCp1zP8kdWLDkPGdWE+3ZAHkTE
	ns2XFBWYvaUXBLq2c1coLvls8l1h7DKnvife386IpkibhnaRDTQU0vgdlaW3hPMnprvo/1Q4rERC+
	+t1pT+fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvdVv-0000000F96D-0OB9;
	Fri, 21 Mar 2025 14:38:23 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvdRC-0000000F7q4-0AaX
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Mar 2025 14:33:31 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so18715875e9.3
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Mar 2025 07:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742567608; x=1743172408; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tUD2C4napqD5vuJG3mWPuzbrUFJy02UiM24OoqoE4Pw=;
        b=PNgpMFVLMB5ZeAS00ayf60eKVvrDKEEcV1FuQJiHcLz45gX1iUjTNYdJuur/MHhisI
         rbe0A7rdClYI6qeuYa8bUcPI53/ld+CfKyB5eUj9lWEAKaJD4xar2JWaMudX2KJi6ExH
         opINDT/QVWiJR36XJy9R6S+SoHVSD0jZQ1IZWVa8FkHckqDHLlPmB50unKDk4n4pMa05
         PmzOpL/uTwv2FwdBbWiJOWvHJMdh7a3UUQDPzRzEJS5l3ICAJL/FkrWjk0aNfLM3Xhs/
         a78P/DJyxR9+O+THFruQo/WtAJRx3IlegMUoYYoKnU8RifBavCKQFZyPMGhD1nBfDNdo
         lL4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742567608; x=1743172408;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tUD2C4napqD5vuJG3mWPuzbrUFJy02UiM24OoqoE4Pw=;
        b=ocxC/Bpl0HgCiiH3WU5UFK+H8VfJjYf6Azf0qKfO717943AkQD1roUXASC7OLmcmng
         EPF5wUGM5zYgvG7nQmYD9RMd5vTdmsi1ip4zUHf5jtOV3XJYfZQ62f9+sIVnR91xiqEL
         bZipg3ho9zNaKLQOHt/puD2VNmoWYCDa+dC4YC2zVLa2hcuv8ufuiRBDmQ8eg/DDrDOf
         WUFArzIPUe+PMc3vWXHWylCrHl8Lg6KP8ZMX0emMZczimMSz7jMGpJ8Eqo5BYHoFOozn
         E2GjZBAMEFvVOkvfxIeA1EckaQuYmSie4H/nCHAXksLOZ/f2F/XmLp1dCIbWWJL7hmk/
         QBjw==
X-Forwarded-Encrypted: i=1; AJvYcCWZmHiWqPsWwkEJ1ZqNVB9u/uezkX+kMTQIKMeQyB35WVWakJnp8huibly+Bu1IDfbbmgfc9y5MW6dZ6wlyOw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3xliL394hYqYPvBCnyMMmqxvKh5Tv7D9ecDljdaALXNfCL5wH
	2zlIYQIzgm0gSCbMcsaKAb/QW8FAXf6Bci7PYzYhqCSfk/K7SoCfgUfTzHAEiVk=
X-Gm-Gg: ASbGncvbOPxnVS+DWMQP/ETh66hDn90P+Fp6w/U9LYW2JzXBYAVrAQO3o2/kWok+s/D
	XPL+FYYzbb8d2RthGOd3IbmZUiXip79TGxB+6KydFdu014Wj/AJDPl1IiR8yWR88qGSTyT/VDYb
	iZsL3EnOJKmCeo+wzsX0RtH+8V32lVQ8UcoFybw2kXpHiw2kv+qaMdiFO/OIh/bhpSMBlvG6sFf
	rDBCYGbtKNliIpxr/4KzrDALg7uFYqTP2LMszxHUFxotLindvBj5h4/3wjc778RfPCpD+abOon1
	hpqagwF6gk1S+Z+icnNntr9qaa5G6r63UGDL3MwwCRQVPPHVeA==
X-Google-Smtp-Source: AGHT+IE5scubJ0VsHC95sgPGt3vHpE3oh+MVNiVP1Pc3QU8Ck8WcINMszQ1SBq9HrIYqlen8eCaP3A==
X-Received: by 2002:a05:600c:4e08:b0:43c:fc00:f94f with SMTP id 5b1f17b1804b1-43d50a36d46mr33019815e9.23.1742567608597;
        Fri, 21 Mar 2025 07:33:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d4fcea400sm28794055e9.2.2025.03.21.07.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:33:28 -0700 (PDT)
Date: Fri, 21 Mar 2025 17:33:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shayne Chen <shayne.chen@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [bug report] wifi: mt76: Check link_conf pointer in
 mt76_connac_mcu_sta_basic_tlv()
Message-ID: <868e456f-10db-4b0c-bb29-76e3c0d03cc8@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_073330_089081_DC51B7F0 
X-CRM114-Status: UNSURE (   5.55  )
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

Hello Shayne Chen,

This is a semi-automatic email about new static checker warnings.

Commit 9890624c1b39 ("wifi: mt76: Check link_conf pointer in
mt76_connac_mcu_sta_basic_tlv()") from Mar 11, 2025, leads to the
following Smatch complaint:

    drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c:394 mt76_connac_mcu_sta_basic_tlv()
    warn: variable dereferenced before check 'link_conf' (see line 376)

drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
   375	{
   376		struct ieee80211_vif *vif = link_conf->vif;
                                            ^^^^^^^^^^^^^^
Dereferenced.

   377		struct sta_rec_basic *basic;
   378		struct tlv *tlv;
   379		int conn_type;
   380	
   381		tlv = mt76_connac_mcu_add_tlv(skb, STA_REC_BASIC, sizeof(*basic));
   382	
   383		basic = (struct sta_rec_basic *)tlv;
   384		basic->extra_info = cpu_to_le16(EXTRA_INFO_VER);
   385	
   386		if (newly && conn_state != CONN_STATE_DISCONNECT)
   387			basic->extra_info |= cpu_to_le16(EXTRA_INFO_NEW);
   388		basic->conn_state = conn_state;
   389	
   390		if (!link_sta) {
   391			basic->conn_type = cpu_to_le32(CONNECTION_INFRA_BC);
   392	
   393			if (vif->type == NL80211_IFTYPE_STATION &&
   394			    link_conf && !is_zero_ether_addr(link_conf->bssid)) {
                            ^^^^^^^^^
The patch adds a NULL dereference but it's too late.

   395				memcpy(basic->peer_addr, link_conf->bssid, ETH_ALEN);
   396				basic->aid = cpu_to_le16(vif->cfg.aid);

regards,
dan carpenter

