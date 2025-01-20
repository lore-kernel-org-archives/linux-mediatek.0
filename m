Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EABCEC02185
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jan 2025 09:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mN2vzQN2MHhC7vsZGZLLyTF4vEgyb2J5Y6QFwZ7uVNs=; b=GmvunnRc8PBtWdCrTktMjLfVGF
	p/F+7EC6in5KfcA01NPhUKDiBb2fG2YTltw98U3LRRcnN1eb13+rzd10KIAtWBItgBgjRe7S66aWU
	KYc+j8SIg5te3pFlLfs+Kcd/Pwk+R+NSillHQGxhWET6wX+kC64IupBUI2Cb1EC67FiLxqRsTfKVN
	ZdTh9czljp2CGpD1+rprXlNiYv5spy07sb5ZlC00ZVhtnrwWT44e6gqzaN/9CfgLDH2ALsTXeU8nR
	v4JG0I/fLa7Xj3w+A42gAie4UB1e9D4Xpv4G98KquL1lgNkXoQl4+f9a0+EB//aFVqeQbD4t9pkV/
	fknRoMsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZoV3-00000005Fi4-3n1X;
	Mon, 20 Jan 2025 09:55:17 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZo6x-00000005Bpb-1ncy
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Jan 2025 09:30:24 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-38a34e8410bso2192175f8f.2
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Jan 2025 01:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737365422; x=1737970222; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mN2vzQN2MHhC7vsZGZLLyTF4vEgyb2J5Y6QFwZ7uVNs=;
        b=ffixmnZFJXXCRgiSILTL/XI1wUbdC6rbZQ/Q7T2Xk1wSYKMGMJii9P9OA9aL87AezZ
         ni1dVh7HC0q7NOLdUD/VeAaAY6RX+uM40MgEp0FASJnvLDxOVESg6VO+ku+UfuYBR2jG
         TTVIRc8ErA4O4CaK8nitigxT82t6G5C/poEHOSOkHGorschfd8fyKILQzGyJFCePNwrl
         qsZyjGAz4po4jqVnbuXie8UleIWuJptbEHmiPeqO36eh8S4rCpd7cfyml8BkMJM35kYW
         lH67d5PPonwkQytwS0H4cYnt5J9XgVYje/I+iNhYF5rT3HQ7SiC856u3caRFcJGwRDRe
         XtTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737365422; x=1737970222;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mN2vzQN2MHhC7vsZGZLLyTF4vEgyb2J5Y6QFwZ7uVNs=;
        b=qTGmQS3t1kzYqkXoKhZRnpUh5dgG9TvNn78h6OJTQ/s0k1eslSIXeVul1Q1rovkkLP
         /7EauCjCOfY5xpZbb7h/bMMPATuV5siPzVHEuywwqMsmJJ/CaHZKQBU4mBSG91EWW3yh
         AHYlTDIZaMnICh9exAB8dl+dhiJK6UueIjUlzFJEXn4hflfbmN5RRqhoKsF3FiT7KOgl
         tVChWir5/+GfFdViUS6UXfxtHvOSbl46iflQsJ3ISi75hbbqfA4ODco/8FZr5ervvJPE
         rO2E5lsci/1kTLk3IleXn+7T/LnYS8Tnj0jebWytGiJCGWTfZh8Mi91hq8VtxvgTBsl/
         piRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyyfdxMUvDX1DXW1IwQixOJAt6dpnG7ysm875htPnU5JC1bgcAKahmmdilK2QKyWmnS2RWhCNcPfa8pnNi9w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxD9kmYrbNsnZr5msBnx9D9F5JreA8SJ1LYRLuOFOKzGJb0k5lN
	ReJhontlN0BADeffGApTMSGpuASmLuO1vM3KKJbTRmKKGApr0XxZqbPeyyX7wRg=
X-Gm-Gg: ASbGncvm4+VfUINL8axyoaKXnRDUpWzpcxT+mIJYLYIamgqc3lm9lELTD72favdZa9V
	G1cAmjWLs1LwGFAJbIjcAybslCIv73y/j0jzuJ/c+VKLG8OuoNL69r5OnQNUdvzzbgvkQwvnAt8
	NYNsfZI1JgFElYFd6XrW+FGSpmYLvtQnaVN4d4zshDnzJjpc9lV5hhOe7IFj6SkaXGPQ947rLrt
	+y13NVIgj8jwap2wkTvdAkl3f0t3vM2sCEsRKYbCafbFsxfFiPeJTd0+aUWmd/OA1VrrVRaHqo=
X-Google-Smtp-Source: AGHT+IEZXASFrmYShzNvlF7HMBo84fpqQweouX7QZO3kXwCjuF6druhkZHwPyP/GtHrteNSIXdX06w==
X-Received: by 2002:a05:6000:1f85:b0:38b:e32a:109d with SMTP id ffacd0b85a97d-38bf59e1d83mr9745687f8f.34.1737365421747;
        Mon, 20 Jan 2025 01:30:21 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43890468869sm130364155e9.35.2025.01.20.01.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 01:30:21 -0800 (PST)
Date: Mon, 20 Jan 2025 12:30:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Charles Han <hanchunchao@inspur.com>
Cc: linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [bug report] wifi: mt76: mt7925: fix NULL deref check in
 mt7925_change_vif_links
Message-ID: <7f806676-a698-4081-81b7-4a48435d2f82@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_013023_576958_71DB7327 
X-CRM114-Status: UNSURE (   7.07  )
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

Hello Charles Han,

Commit 5cd0bd815c8a ("wifi: mt76: mt7925: fix NULL deref check in
mt7925_change_vif_links") from Oct 25, 2024 (linux-next), leads to
the following Smatch static checker warning:

	drivers/net/wireless/mediatek/mt76/mt7925/main.c:2053 mt7925_change_vif_links()
	warn: inconsistent returns '&dev->mt76.mutex'.

drivers/net/wireless/mediatek/mt76/mt7925/main.c
    1947 static int
    1948 mt7925_change_vif_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
    1949                         u16 old_links, u16 new_links,
    1950                         struct ieee80211_bss_conf *old[IEEE80211_MLD_MAX_NUM_LINKS])
    1951 {
    1952         struct mt792x_bss_conf *mconfs[IEEE80211_MLD_MAX_NUM_LINKS] = {}, *mconf;
    1953         struct mt792x_link_sta *mlinks[IEEE80211_MLD_MAX_NUM_LINKS] = {}, *mlink;
    1954         struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
    1955         unsigned long add = new_links & ~old_links;
    1956         unsigned long rem = old_links & ~new_links;
    1957         struct mt792x_dev *dev = mt792x_hw_dev(hw);
    1958         struct mt792x_phy *phy = mt792x_hw_phy(hw);
    1959         struct ieee80211_bss_conf *link_conf;
    1960         unsigned int link_id;
    1961         int err;
    1962 
    1963         if (old_links == new_links)
    1964                 return 0;
    1965 
    1966         mt792x_mutex_acquire(dev);
    1967 
    1968         for_each_set_bit(link_id, &rem, IEEE80211_MLD_MAX_NUM_LINKS) {
    1969                 mconf = mt792x_vif_to_link(mvif, link_id);
    1970                 mlink = mt792x_sta_to_link(&mvif->sta, link_id);
    1971 
    1972                 if (!mconf || !mlink)
    1973                         continue;
    1974 
    1975                 if (mconf != &mvif->bss_conf) {
    1976                         mt792x_mac_link_bss_remove(dev, mconf, mlink);
    1977                         devm_kfree(dev->mt76.dev, mconf);
    1978                         devm_kfree(dev->mt76.dev, mlink);
    1979                 }
    1980 
    1981                 rcu_assign_pointer(mvif->link_conf[link_id], NULL);
    1982                 rcu_assign_pointer(mvif->sta.link[link_id], NULL);
    1983         }
    1984 
    1985         for_each_set_bit(link_id, &add, IEEE80211_MLD_MAX_NUM_LINKS) {
    1986                 if (!old_links) {
    1987                         mvif->deflink_id = link_id;
    1988                         mconf = &mvif->bss_conf;
    1989                         mlink = &mvif->sta.deflink;
    1990                 } else {
    1991                         mconf = devm_kzalloc(dev->mt76.dev, sizeof(*mconf),
    1992                                              GFP_KERNEL);
    1993                         mlink = devm_kzalloc(dev->mt76.dev, sizeof(*mlink),
    1994                                              GFP_KERNEL);
    1995                         if (!mconf || !mlink)
    1996                                 return -ENOMEM;

Need to call mt792x_mutex_release(dev) before returning.

    1997                 }
    1998 
    1999                 mconfs[link_id] = mconf;
    2000                 mlinks[link_id] = mlink;
    2001                 mconf->link_id = link_id;
    2002                 mconf->vif = mvif;
    2003                 mlink->wcid.link_id = link_id;
    2004                 mlink->wcid.link_valid = !!vif->valid_links;
    2005                 mlink->wcid.def_wcid = &mvif->sta.deflink.wcid;
    2006         }
    2007 
    2008         if (hweight16(mvif->valid_links) == 0)
    2009                 mt792x_mac_link_bss_remove(dev, &mvif->bss_conf,
    2010                                            &mvif->sta.deflink);
    2011 
    2012         for_each_set_bit(link_id, &add, IEEE80211_MLD_MAX_NUM_LINKS) {
    2013                 mconf = mconfs[link_id];
    2014                 mlink = mlinks[link_id];
    2015                 link_conf = mt792x_vif_to_bss_conf(vif, link_id);
    2016 
    2017                 rcu_assign_pointer(mvif->link_conf[link_id], mconf);
    2018                 rcu_assign_pointer(mvif->sta.link[link_id], mlink);
    2019 
    2020                 err = mt7925_mac_link_bss_add(dev, link_conf, mlink);
    2021                 if (err < 0)
    2022                         goto free;
    2023 
    2024                 if (mconf != &mvif->bss_conf) {
    2025                         mt7925_mcu_set_bss_pm(dev, link_conf, true);
    2026 
    2027                         err = mt7925_set_mlo_roc(phy, &mvif->bss_conf,
    2028                                                  vif->active_links);
    2029                         if (err < 0)
    2030                                 goto free;
    2031                 }
    2032         }
    2033 
    2034         mvif->valid_links = new_links;
    2035 
    2036         mt792x_mutex_release(dev);
    2037 
    2038         return 0;
    2039 
    2040 free:
    2041         for_each_set_bit(link_id, &add, IEEE80211_MLD_MAX_NUM_LINKS) {
    2042                 rcu_assign_pointer(mvif->link_conf[link_id], NULL);
    2043                 rcu_assign_pointer(mvif->sta.link[link_id], NULL);
    2044 
    2045                 if (mconf != &mvif->bss_conf)
    2046                         devm_kfree(dev->mt76.dev, mconfs[link_id]);
    2047                 if (mlink != &mvif->sta.deflink)
    2048                         devm_kfree(dev->mt76.dev, mlinks[link_id]);
    2049         }
    2050 
    2051         mt792x_mutex_release(dev);
    2052 
--> 2053         return err;
    2054 }

regards,
dan carpenter

