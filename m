Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA777C36000
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Mar 2025 14:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dCM/0pxY2Et0ZhXNOx5M/rBqqFuiIGPsmpAIcE+cA+0=; b=JBu242yGFVrBnVNkqXDTWdfaRW
	blL0Xzejs3f3EtQkAwxfhTp3zg/b3cDu2/79VuM0fVSnaqIGZihqpQzYvlxMI3uVeuAtO7t/WUTsl
	akB7pXzj33i4HuaibGRSHhvBXXajLOR+Sufwv94hQFD8Fu+C48MEcD8e5kVJJD/AUG3jSXH9WaSvA
	PzStdXB0UcFr0XByJ1NQUpo9xKABDZWRWvD5l24wXPAP+mVTw620h6oBDmzbp8pBpyyJjvYx+LoKG
	DtNP4zNJO7hTzGQ41M30orEu8jkbksJsEYsP2ALrATwhm09d7EPJKpPtnJE0qjr2o6tMwc7gYpR8B
	lPW6MjVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvdVu-0000000F964-3JZN;
	Fri, 21 Mar 2025 14:38:22 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvdR7-0000000F7oL-2a5N
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Mar 2025 14:33:26 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so21672205e9.3
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Mar 2025 07:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742567604; x=1743172404; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dCM/0pxY2Et0ZhXNOx5M/rBqqFuiIGPsmpAIcE+cA+0=;
        b=RDZk/iRBIR5YW64pc+BU96W0Sx766UVOIVD9Is7R2XVjT5c9Q4m1cqTqKoFpWyIHkW
         8brp+mmNyTaGl3yk0DiSWaFrOyxv2gwZLVA139yjkJXt5P6B9p1/nDNDNogP/A4JvKf2
         HHGQJ/6VOVZYTq8kCJaiebNw1aD+pqf2QbyAU690MSfWbnzFTYLo+0S2Lcyoc3Ye6exM
         2/Jah1VDvxrVD+VCqHTT0MhkoFWr2MdLmlNaTisSTaraPscZ0Ivex3/CSv345itfK5dw
         a9tI9ouW8Q+g3eTdYLFFW5Hx2VsIQcEl8DSOgI2XWRbT8iZh3DvdaErgMnpEbAVH+qUn
         rHkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742567604; x=1743172404;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dCM/0pxY2Et0ZhXNOx5M/rBqqFuiIGPsmpAIcE+cA+0=;
        b=uVU/CFLTLm0pTxBV+JJlnld8hN1hAlfOiz97Sn0/YqY8KHTyAu34te9nG7z6N8BBaR
         IFGd6In4ao738881jamYSa3atuSb0VQQSnuYz6WTUkezgy+HT2bTBzMEcKoGbt1I778W
         uMoWvCepguzmMaYxEEaDDqMUn7Vpl2fjYtcPT0Za5FFapj6GwZGQfimZjXrHGnY8bbHc
         YfT5PWafkjFwmnKoNCYQ7/ymiPuWtgYv5WNhmsqznTUKirTYAwdvBFEW87wtxmU0Ej//
         302esRlDaWKhPjNmHaT2EGc0DP9qDH79Ph99/0vMuprKrmUj2alwI9TZdVjFsEgffQek
         eGwg==
X-Forwarded-Encrypted: i=1; AJvYcCWWxKBLnpTrrLO+7qvezbqxitYBOP95CyiLzqUn6K6Ik94iDVDHgNp8whBDjIGcDRvGYSNMptEWgGujCsDJ5Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxXLS3pd00LubX5/1DA2FtvPFToonRbtMRHqDcEQoV4gWbz3gzb
	vR8olQXBJmADjzAATUDaUjyHo7XDkv4KyNE9bSnVeFyw7ARgRCS+US/eZWygjCI=
X-Gm-Gg: ASbGncu+yRIWWpG9Qbn21D/0QRv4XXutmvcV/UNJx3p8HQxpPOxN4cwAKnveaDPebNr
	IXkET1Mvj/OjtvJIn5p3yZOYI3BXRb7gN3gRc4lfLDWI2r3F6pa/C2xdKuQdAnUGnI6mdjwNxtU
	cjk5Qfjz1h/fFXEAd9gDj7tdzzlNfTNgtr26ASi26FtC1+zINn6Oy2AMKl/DJFAuvuCuYV9sJyk
	PTNG767DVHvmKreBgKLW3Sd6CUpkflLKbxNvcEpMfu33YrCURFR6Xi3GJHRJPPtRIRkZR1k5dCU
	5y4Q1EUzO9IR3OqvrDybq7G8gkCHXSrNRKb2oahufqBaFRocnA==
X-Google-Smtp-Source: AGHT+IGWV/p7m8S7xqGZKFR3zF2W6QjG0ha40UpvzvNsYp/rwN5LamAAHEDfsFE/TVOy2+owapxVnQ==
X-Received: by 2002:a5d:47a5:0:b0:390:f699:8c27 with SMTP id ffacd0b85a97d-3997f902e3dmr3289351f8f.12.1742567604149;
        Fri, 21 Mar 2025 07:33:24 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3997f9efd61sm2542776f8f.91.2025.03.21.07.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:33:23 -0700 (PDT)
Date: Fri, 21 Mar 2025 17:33:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [bug report] wifi: mt76: scan: set vif offchannel link for
 scanning/roc
Message-ID: <2f5c3a3c-89d9-407a-b163-4b5cc81da319@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_073325_654975_88FF8D4C 
X-CRM114-Status: UNSURE (   4.11  )
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

Hello Felix Fietkau,

This is a semi-automatic email about new static checker warnings.

Commit 3ba20af886d1 ("wifi: mt76: scan: set vif offchannel link for
scanning/roc") from Mar 11, 2025, leads to the following Smatch
complaint:

    drivers/net/wireless/mediatek/mt76/channel.c:307 mt76_put_vif_phy_link()
    warn: variable dereferenced before IS_ERR check 'mlink' (see line 305)

drivers/net/wireless/mediatek/mt76/channel.c
   304		struct mt76_dev *dev = phy->dev;
   305		struct mt76_vif_data *mvif = mlink->mvif;
                                             ^^^^^^^^^^^
The patch adds a dereference

   306	
   307		if (IS_ERR_OR_NULL(mlink) || !mlink->offchannel)
                                   ^^^^^
Checked too late.

   308			return;
   309	

regards,
dan carpenter

