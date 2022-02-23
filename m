Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 675A3C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Feb 2022 08:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pVN5npIRVjciaOGZuUQOJ3lHOBwFEkJ8EEWZtzGyhIQ=; b=CtJxoqZ3EQBFQj
	uv9yuRHeja1vPaZ+WGwdlImP0B0CbepbtwxxcI9wMm6pZ0MdRC8e7SQG04iNu9s3qPPk5S2M3HIED
	5HhazRph0JOCa2v8/Hj99wkhR1sUXJ6qbPPmIxgorHcSGkRB4fYGuvoF4daVuR0W1Fchg/EExLVRc
	3SV0qc5BxUcr9MyUh06vT5DffqQM7ns2L1CtG1Xs2Wdqbd7GqX8jup9ajOEUThSGBYaXcC2HbRE8b
	07VJStZq2khUJ6D6nVjdAQcVabY+0HLes5YZ45ZHFL2uVOeAjfVx77BrkDxs3okWxrbBaLq6JkADr
	HikClHFFcLUOL0P0E7Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMnGN-00DIhb-WC; Wed, 23 Feb 2022 08:44:44 +0000
Received: from mail.olerise.pl ([46.183.184.59])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMnGK-00DIga-QQ
 for linux-mediatek@lists.infradead.org; Wed, 23 Feb 2022 08:44:42 +0000
Received: by mail.olerise.pl (Postfix, from userid 1001)
 id F359844409; Wed, 23 Feb 2022 09:41:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=olerise.pl; s=mail;
 t=1645605775; bh=ZNYiuZLXlxCdAPtstEG/gwJieB5RBwA/cHj1SZ3Mpl0=;
 h=Date:From:To:Subject:From;
 b=EVLorCex1PMeQLrIpJp/WJ/+Nv7EfHdeVvxYhBvRm9zU3YxtTzrHioOy1aCPJMnM7
 Vfj8nvZwWTBb4fHbln2mIzIYPCkpDv+7YSwdZDzFo/ic8eKx/dpJXcLOqoMpO90T4I
 lJ6jH4UX59L3BCOJ/A37CqZEFiwt9B2hO0j8ra4Pfrf+b3on1WgVK79dHLxGV2Kftc
 x2X7M/3m8yi+IkdHyy+0tlFL+CF7wYZugv1anUg4mYshnhIaOi+NH0oEYGZ5g5aZpc
 H1lvrY7D9YgWPTucAHlf7OsAfMRAN5eV9e2v+iYK+gniHJ9mDZ9FWO/P92lh/MYSKU
 z9gHkJpThYKfw==
Received: by mail.olerise.pl for <linux-mediatek@lists.infradead.org>;
 Wed, 23 Feb 2022 08:40:28 GMT
Message-ID: <20220223084500-0.1.1x.fi7m.0.ggjcgamf6c@olerise.pl>
Date: Wed, 23 Feb 2022 08:40:28 GMT
From: =?UTF-8?Q?"Miko=C5=82aj_Rudzik"?= <mikolaj.rudzik@olerise.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: =?UTF-8?Q?Nap=C5=82yw_Klient=C3=B3w_ze_strony?=
X-Mailer: mail.olerise.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_004441_031717_A0C46395 
X-CRM114-Status: UNSURE (   1.77  )
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

RHppZcWEIGRvYnJ5LAoKY2hjaWHFgmJ5bSBwb2luZm9ybW93YcSHIFBhxYRzdHdhIG8gbW/FvGxp
d2/Fm2NpIHBvenlza2FuaWEgbm93eWNoIHpsZWNlxYQgemUgc3Ryb255IHd3dy4KCldpZHppbXkg
emFpbnRlcmVzb3dhbmllIHBvdGVuY2phbG55Y2ggS2xpZW50w7N3IFBhxYRzdHdhIGZpcm3EhSwg
ZGxhdGVnbyBjaMSZdG5pZSBwb21vxbxlbXkgUGHFhHN0d3UgZG90cnplxIcgeiBvZmVydMSFIGRv
IHdpxJlrc3plZ28gZ3JvbmEgb2RiaW9yY8OzdyBwb3ByemV6IGVmZWt0eXduZSBtZXRvZHkgcG96
eWNqb25vd2FuaWEgc3Ryb255IHcgR29vZ2xlLgoKQ3p5IG3Ds2fFgmJ5bSBsaWN6ecSHIG5hIGtv
bnRha3Qgendyb3RueT8KCgpQb3pkcmF3aWFtCk1pa2/FgmFqIFJ1ZHppawoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
