Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4CDCC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 08:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pVN5npIRVjciaOGZuUQOJ3lHOBwFEkJ8EEWZtzGyhIQ=; b=ihZ73w/QfOqSWy
	NzsZrr7S43w+llJVKS8rQAZBrccvF1We9ne9E0imlMRa2/aEOxrZq9t7lwFI8bEZvYEzegR7tsTOK
	pGp1zDT4F2wDpmxXPEovkNIcg5VcJcpXr9MuuWvgP8Clh93l04Zve3q/cNTVTvoxizAs/YUZ50OTD
	KWd1E5kviRua84nrclj5WU7wVEigWNZ8MxR3oi1yT+OQmOloquAuu4ygXa6qHypdKki1MIc8v9wuN
	3P66cZ97e7bb3Aago79qqGsD8FIvl7kvAVDW0AxrWu9OnJXu/BhCLWJgyBjvBesSguli4tWe80baX
	gS2xxTmsS11Ozy3y84vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRVWq-003KpB-0x; Tue, 08 Mar 2022 08:49:12 +0000
Received: from mail.olerise.pl ([46.183.184.59])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRVWe-003Kep-Uz
 for linux-mediatek@lists.infradead.org; Tue, 08 Mar 2022 08:49:02 +0000
Received: by mail.olerise.pl (Postfix, from userid 1001)
 id DF88B441E8; Tue,  8 Mar 2022 09:46:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=olerise.pl; s=mail;
 t=1646729207; bh=ZNYiuZLXlxCdAPtstEG/gwJieB5RBwA/cHj1SZ3Mpl0=;
 h=Date:From:To:Subject:From;
 b=YVNEf1wGg1G7tXLOrrPg2wNjDVmX68kxRb9p+5dK/4Dil4ddZ97ZucvGhs2b6F5ft
 TGDElLoZ9q9IUf4xbgZbOjSlIMjbDImVMqG4SiYEW6t9dXFWFKbVu7wPcb/DDHHfnT
 EduxsMWUXxC2pUL+OlXhGViatbF+rd8dHooXvCGj1HXIz6h43yswkMw+383LWrORZa
 3lt9aH2S2spqBXMcEcnPkwIDXIIZ7H96vunYMVhkEYJEbVk6MtknY+//qh0m3QXdTs
 DA+nzNEOvuiN+2PAPxMfmxU5z0XzG5ieUqGEm1cuAPSwsUeR4ktujOagDXmhLanZQP
 kbMI+4aWoEjmQ==
Received: by mail.olerise.pl for <linux-mediatek@lists.infradead.org>;
 Tue,  8 Mar 2022 08:45:41 GMT
Message-ID: <20220308084500-0.1.26.mt0n.0.qp6vo2hija@olerise.pl>
Date: Tue,  8 Mar 2022 08:45:41 GMT
From: =?UTF-8?Q?"Miko=C5=82aj_Rudzik"?= <mikolaj.rudzik@olerise.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: =?UTF-8?Q?Nap=C5=82yw_Klient=C3=B3w_ze_strony?=
X-Mailer: mail.olerise.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_004901_188093_EEB36E02 
X-CRM114-Status: UNSURE (   1.79  )
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
