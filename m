Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1931C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Apr 2022 21:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3T3UkkZ3ODcu1zKTL2KCCUXHTZkER9YaMrzk3/tIXM4=; b=zKXfXojfSlwl+a
	paRKgPMAdO0rdDv4nueMvg2IUr16/zG8iGKhlAdeYxBxy0D8mqhuyXAvHwvdKvJikZ5Bwy899J3tR
	+A8Mo3g3f//ThyUAG2FtWVezZbI5ZvDqJgw7r4HOWKWdSfSYEkGe0YGOuypWU9bCOZM3qWB4VZtgc
	jIqAvBvNf2JNNA17EAQbuwFwhslLnnSL9/GdUgH+xHnLwU+QsVK8CXgiHZ5fRhQMui4dEGV/RhlPH
	MMh9hlkEmE11SNNkibV02F6q7tVKlgZQOc6oxSiVdjE7IV7A8IRLHbmTCttZLEST7Yd04BgvGaQcr
	n+xUj7Lt2+dvCthZwqWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nekYz-002jyl-Mx; Wed, 13 Apr 2022 21:30:09 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nekYn-002jwD-T2; Wed, 13 Apr 2022 21:29:59 +0000
Received: by mail-ed1-x534.google.com with SMTP id z12so4022019edl.2;
 Wed, 13 Apr 2022 14:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :content-transfer-encoding:user-agent:mime-version;
 bh=wERzMS/7EQkQ9BLfdKeH9OCJBA9aLhKxzyWlCHTVe9Q=;
 b=qwKjNZTg7Dscjj99nDEhphhwY58RXVp/FiRBLbfu8+Npexyda4WXi9+NjQ+5ZYmgsi
 thJA9K8cPz96GoIijulf06YMjESm0R13eLYzW+yMSnNBU/DHY5D02Xq0dIHe9CrIlgYh
 /rkkg2cjJYaTJO84qp2s/dB/9/iQg1hbRgxJOL04G7dZ86Op/Rqwo8MBHsJO1PptlE4p
 z9nVZFWpMQPNyG7S2EwGt1EPBp+I5QQ25eNXUADspGtOSWdS8lvLs5zfFbA98cq+lPY3
 Y1vXaJ/typYH3CewPetiKsxup2AEe/nFAe1arXVbVgAYKA4E5X5EjMO+XMvdAcT4KjKb
 nzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:content-transfer-encoding:user-agent:mime-version;
 bh=wERzMS/7EQkQ9BLfdKeH9OCJBA9aLhKxzyWlCHTVe9Q=;
 b=HdkmeBl4PY2mkxF5F89X2X3pf2VsbxMnZLhHm0YRftszJmWAN4/7fdE1J0pce7xNJD
 Xe4XW+zmNnErxzUFDEAf6afq3+FyyFYQmkMVj7tYI/jGgDiGPmxmMvNz9SA//dlTQY8E
 Eut884+uhuBNCXYCoh0N1IJHVc6keK3/yLBCkT8RI7G6qEtSMzj7Oz/7ys8Q2M9APhuG
 QCVAqRDvq3C4azFEL2B8vHXhuBi9szi/1KEIunHJ4UsFiPGyd1Kouaoqq7P+83x6uxx0
 jJMwkuH2t2jD8sViSLP798l7II9dlVQMtJGo95Q2RvwhVdCtUV65KCI4ixh6TnnK/rHW
 P9BQ==
X-Gm-Message-State: AOAM530HOUV/6Uw+Dc0A/4F/XIqhfE8d+RANW8TteycnOATH0JfzVEEE
 OsMvMHQDexdG4KnlpOXzsKE=
X-Google-Smtp-Source: ABdhPJxyqY4Vhr7TJaX4LP58Wcgv3ORgMl61v3D7KD0d0KqQflSkvl5TOgG+liX0OTZ1cyX+Ml8VNQ==
X-Received: by 2002:a50:a408:0:b0:41c:cdc7:88bd with SMTP id
 u8-20020a50a408000000b0041ccdc788bdmr45822582edb.399.1649885395150; 
 Wed, 13 Apr 2022 14:29:55 -0700 (PDT)
Received: from [192.168.3.2] (p5dd1ed70.dip0.t-ipconnect.de. [93.209.237.112])
 by smtp.googlemail.com with ESMTPSA id
 kw3-20020a170907770300b006d2a835ac33sm22266ejc.197.2022.04.13.14.29.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 14:29:54 -0700 (PDT)
Message-ID: <dcd403b025eb28186c3f05d682c383cb06e5b8ee.camel@gmail.com>
Subject: Re: [PATCH 1/1] scsi: ufs: remove redundant HPB unmap
From: Bean Huo <huobean@gmail.com>
To: Po-Wen Kao <powen.kao@mediatek.com>, Alim Akhtar
 <alim.akhtar@samsung.com>,  Avri Altman <avri.altman@wdc.com>, "James E.J.
 Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: wsd_upstream@mediatek.com, peter.wang@mediatek.com, 
 stanley.chu@mediatek.com, alice.chao@mediatek.com,
 chun-hung.wu@mediatek.com,  cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com,  yohan.joung@sk.com,
 jason.li@sk.com, linux-scsi@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-mediatek@lists.infradead.org
Date: Wed, 13 Apr 2022 23:29:53 +0200
In-Reply-To: <20220412073131.10644-1-powen.kao@mediatek.com>
References: <20220412073131.10644-1-powen.kao@mediatek.com>
User-Agent: Evolution 3.44.0-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_142957_987896_FB3B001D 
X-CRM114-Status: UNSURE (   7.71  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFBvIHdlbiBhbmQgUGV0ZXIKCgpJIG11c3QgZ2l2ZSB0aGlzIHBhdGNoIEFjaywgYmVjYXVz
ZToKCjEuIOKAnGZIUEJSZXNldCBGbGFn4oCdIGNhbiBiZSBzZW50IGluIGJvdGggaG9zdCBjb250
cm9sIG1vZGUgYW5kIGRldmljZQpjb250cm9sIG1vZGUuIOKAnGJ1ZmZlciBpZD0zIEhwYldyaXRl
QnVmZmVy4oCdIGNhbiBvbmx5IGJlIHNlbnQgaW4gZGV2aWNlCmNvbnRyb2wgbW9kZS4KCjIuIOKA
nGZIUEJSZXNldCBGbGFn4oCdIGluYWN0aXZhdGUgYWxsIHRoZSByZWdpb25zIGZvciB0aGUgd2hv
bGUgZGV2aWNlLgrigJxidWZmZXIgaWQ9MyBIcGJXcml0ZUJ1ZmZlcuKAnSBjYW4gb25seSBpbmFj
dGl2YXRlIGFsbCB0aGUgcmVnaW9ucyBmb3IKdGhpcyBMVU4uIFRoZSBMVU4gaXMgd3JpdHRlbiBp
biB0aGUgVVBJVSBoZWFkZXIuCgpJbiB0aGUgdWZzaHBiX2luaXQsIHdlIGhhdmUgc2V0IGZIUEJS
ZXNldCBGbGFnLiBoZXJlIGRvZXNuJ3QgbmVlZCB0bwppc3N1ZSDigJxidWZmZXIgaWQ9MyBIcGJX
cml0ZUJ1ZmZlcuKAnSBpbiB0aGUgY2FzZSBvZiBkZXZpY2UgbW9kZS4KClJlZ2FyZGluZyB0aGUg
cmVzZXQgZmxvdyBpc3N1ZSB3ZSBhcmUgdGFsa2luZyBhYm91dCwgSSB3aWxsIHN1Ym1pdCBhCmZp
eC4KCgpBY2tlZC1ieTogQmVhbiBIdW8gPGJlYW5odW9AbWljcm9uLmNvbT4KCgpCZWFuCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlh
dGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
