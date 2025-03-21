Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D717C3600A
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Mar 2025 14:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=adFZmJLQKFx2XqizsrAQWSoaZBuWMbRGXmjBb8zBkJU=; b=g+Md8zKzswgA1oQM5ps6xdrmZK
	p010lRtvuoMcuEf4GjHcKzVrUW3QRd+RIGvdxaPUYfHwfHKLywxaAG5J/EbiBsGdQoajOAbwvySHi
	xWm8/5BmxMFlpy1XLKPy7rL+C5+QUeNjcHt2Fj0jYDwClfN+E4kBVvAJrZ5UQ7Uy+AeNXdlqs/XMP
	beQOu8ljkBCmXjw/cCzHzQ/AEeMKmJtVFE4CmG6bTCnI6FaKh0nH2wblN+q8s+LjiCRYxTOFkM8Yi
	nk0RM/u020P5gn+IH3K36rDf011ssVTFAFZOm/OsE6/NL3jClsI6q2N1c/peWKtw6jI+/AJvd+l7q
	3+ZsCsHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvdVv-0000000F96T-1dqs;
	Fri, 21 Mar 2025 14:38:23 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvdRH-0000000F7rv-3t9J
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Mar 2025 14:33:37 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso13545905e9.0
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Mar 2025 07:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742567614; x=1743172414; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=adFZmJLQKFx2XqizsrAQWSoaZBuWMbRGXmjBb8zBkJU=;
        b=cdjELvYyRfIluJPdnYnIXjlCWLguVuLWBEqWP/7DL03wMts2KNiDvVRPDNMhO3F9R2
         wzsAQjvyRpRCc6G1yOdFwT7TqTA6lp9v3EMi1t9dTYodW/bMTwleI0s5HI1hd4L5jwFc
         cleljA1YyEebPUlQuMkjzGM3wYgzj58OW3Djccg8XvP7hCaWNAMKo9TGDnL/x1Ztb2GZ
         EWmvi7O7xRaXfnGi1SiPRn9nifxFIxEOP3CSLo6kN763tFEVYchQeCxftPjC06YmKCx4
         qwyeHxXNtnbJoy2liwXGLBJIHvz/VeT5YUUuKFUEMkFCkqaWff3EzEC35AGFHUohwSif
         pYog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742567614; x=1743172414;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=adFZmJLQKFx2XqizsrAQWSoaZBuWMbRGXmjBb8zBkJU=;
        b=NtYlAfNhpR2eP0vrbtGgfvxl43gjZOIZaWkyezkPUlMtbCgjzAhG3sJo+FpH67YWnD
         8fl1Ny3VX9cG/6OZdL1lqx2WDJDbFJ6eBcfOOKgt5Rrvoc5nTFkdykNNM0rTt+yqWulJ
         LhebS7pNaqrcTKQB7w9dGAsqC1X6rvnvKeQGn33hzMAhhqE5k3gZ2UH3aVmiHmqmM5i8
         AJieXbeaM8QIPXuuODUnZi5cHeHUyL/KYHBaLmsWa8NaDuFiLdLt/fZXn+5estT6nGKK
         jQI7sesL5e0xCISb9Iyb3eTpQv89liBdltJQu5GaTvAFGk4yvo4ORiW3VjYe8cAJcCMy
         xm7w==
X-Forwarded-Encrypted: i=1; AJvYcCWvTCII6RmtTBzFVYXF6ys3c/ra54HMPIfgBuLVSQ9eVwi/sNCh/mqyCXRN727SiLCdIOv8SctKOnSaFQey7g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx64bTHhKO+D1dX1k8xDyCZmXG+XS4dqjgQ/DoDEK3Mrg+/B0b9
	Ve19jhzOYMheW2zHJrBUw9410v3xt3BOchYU8bHGk898XmVhCd63av/NDCLLxdxcxMb41XoxcAl
	k
X-Gm-Gg: ASbGncvT6Ny0NqDQPqkFeS3MZev8tEGTaouoDmuzo2LLMeM6dVXBlqP1Mn4nwJlzG7J
	fEcA2O6q7zOcMt8a7b/Z3C8aYrwb0yAsyXbS5GZ8e1eNJa2J0DvdNd3eB3QDIIo8iKNiPJhkjHr
	9tvhjsUqLYrsmrR/6aTJblPAGIQa8ECWv8/kmYMC7zA1H30n4ZP/cG6Eksg1/i7fGuwNQXA4O8P
	yhiFREfOt/tuPw5Hmox2eRWHxwSw6ce8vNMXXIU0zTqVluooFH9AGsHJt0mzFQyrOQafCpJ6AOW
	RQI3bRMdTg1Kuc3PUCok378n9G0p1k8bG0rPfCRXsBBBq4T+C3M1wRhY3j+N
X-Google-Smtp-Source: AGHT+IEQYzpu2so8XX8P3XLbdEYx3pHR0HTy7KQMupXaaPxmsyyZx2ggZsrMFgeKU+LL76EUOG6V2A==
X-Received: by 2002:a05:600c:3591:b0:43c:f3e1:a729 with SMTP id 5b1f17b1804b1-43d491b708dmr68646465e9.12.1742567614375;
        Fri, 21 Mar 2025 07:33:34 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d4fd2704bsm28339255e9.18.2025.03.21.07.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:33:34 -0700 (PDT)
Date: Fri, 21 Mar 2025 17:33:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [bug report] wifi: mt76: mt7996: Rely on mt7996_sta_link in
 sta_add/sta_remove callbacks
Message-ID: <f335328d-8554-401b-83c2-36e8d7668a62@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_073335_967844_93E944D4 
X-CRM114-Status: UNSURE (   4.86  )
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

Hello Lorenzo Bianconi,

Commit dd82a9e02c05 ("wifi: mt76: mt7996: Rely on mt7996_sta_link in
sta_add/sta_remove callbacks") from Mar 11, 2025 (linux-next), leads
to the following Smatch static checker warning:

	drivers/net/wireless/mediatek/mt76/mt7996/main.c:1023 mt7996_mac_sta_add_links()
	error: uninitialized symbol 'err'.

drivers/net/wireless/mediatek/mt76/mt7996/main.c
    984 static int
    985 mt7996_mac_sta_add_links(struct mt7996_dev *dev, struct ieee80211_vif *vif,
    986                          struct ieee80211_sta *sta, unsigned long new_links)
    987 {
    988         struct mt7996_sta *msta = (struct mt7996_sta *)sta->drv_priv;
    989         unsigned int link_id;
    990         int err;
    991 
    992         for_each_set_bit(link_id, &new_links, IEEE80211_MLD_MAX_NUM_LINKS) {
    993                 struct ieee80211_bss_conf *link_conf;
    994                 struct ieee80211_link_sta *link_sta;
    995                 struct mt7996_vif_link *link;
    996 
    997                 if (rcu_access_pointer(msta->link[link_id]))
    998                         continue;

What about if there are no new links or we hit the continue on every
iteration.

    999 
    1000                 link_conf = link_conf_dereference_protected(vif, link_id);
    1001                 if (!link_conf)
    1002                         goto error_unlink;

error code?

    1003 
    1004                 link = mt7996_vif_link(dev, vif, link_id);
    1005                 if (!link)
    1006                         goto error_unlink;

error code?

    1007 
    1008                 link_sta = link_sta_dereference_protected(sta, link_id);
    1009                 if (!link_sta)
    1010                         goto error_unlink;

error code?

    1011 
    1012                 err = mt7996_mac_sta_init_link(dev, link_conf, link_sta, link,
    1013                                                link_id);
    1014                 if (err)
    1015                         goto error_unlink;
    1016         }
    1017 
    1018         return 0;
    1019 
    1020 error_unlink:
    1021         mt7996_mac_sta_remove_links(dev, sta, new_links);
    1022 
--> 1023         return err;
    1024 }

regards,
dan carpenter

