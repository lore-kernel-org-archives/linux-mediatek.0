Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C34CC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Feb 2022 08:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6kNwzPvGzidbG4OA5QxiM6sc/+Nc/++DW5Aj0Y+D8AA=; b=xLoIUpXNDsEBYA
	fuk2jYLIWQiDRu7BAGtndc7R8R3Cm74Oi4SbTmkvzcH2z4vNRtNOrgbnc1Suz/lG8D4AFA9a7BjyI
	5VfX2LxA7Y9SQ6om5r7xuqZomhEacj+LkfFdHQiCRPfDZ1yWc8LJR972EY2bm8jvOtSpYY/ZGS1MN
	RnNz+nHIHNa5R41jcl/zpILqI3PQCrqWy0pxxARWRFovH2cL/mYEkfmm4MbuRsDqu8YJDolqRyBHw
	DcRHzTfMiQA9uWpoISuWpyJdxEp0h6VZ0S6zxOqRtK5fIA57ncYU/vrzXrCsEYOSkhbjc1vePUQAs
	6R2dzx0x83nUcqR80n8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nI5AO-003AVc-U2; Thu, 10 Feb 2022 08:51:04 +0000
Received: from mail.trixen.pl ([192.71.213.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nI5AE-003ASm-4C
 for linux-mediatek@lists.infradead.org; Thu, 10 Feb 2022 08:50:59 +0000
Received: by mail.trixen.pl (Postfix, from userid 1001)
 id B19D940C20; Thu, 10 Feb 2022 09:50:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trixen.pl; s=mail;
 t=1644483052; bh=J50dbWEn9x62xyxY1PWPtYxMwNMcDFoILqXfzM3his0=;
 h=Date:From:To:Subject:From;
 b=kqvvX6yn6iiu4XKeXJ2r3iU77nFu9m28HLtyvBJFSp24i7KQBN7ghgurg/8u3Q8pQ
 st4EUSMb/TfoOgb/6L6nynExMxq/BaAii/Kw/o3QTjBB+ilPs+8ZqCcDmdM7M2E5yk
 fHytJ7O2lFGRDtK8zj5/d0kbTCEHMi5MLhOCgMPcuAtrdmAwts5CFgbedC0Rgzbc8R
 q7B8qdPYlHktH1w2pwyE7IfBhTThcwUNrkg5lGxAGzc0Ue0k+WGPt4UmQI5piocOHl
 /7KtNyxKSoIdkZub1g4XbzQfydt+7xvEJmkruw0ik3K/jvUdmkY3zV1iM9t4KqH4vG
 6BwfPavWh1pQw==
Received: by mail.trixen.pl for <linux-mediatek@lists.infradead.org>;
 Thu, 10 Feb 2022 08:50:34 GMT
Message-ID: <20220210084500-0.1.t.1u30.0.6amaw6peu9@trixen.pl>
Date: Thu, 10 Feb 2022 08:50:34 GMT
From: =?UTF-8?Q?"Rados=C5=82aw_Grabowski"?= <radoslaw.grabowski@trixen.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: Monitorowanie samochodu
X-Mailer: mail.trixen.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_005054_337768_550DA171 
X-CRM114-Status: UNSURE (   1.43  )
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

RHppZcWEIGRvYnJ5LAoKQ2hjaWHFgmJ5bSBwcnplZHN0YXdpxIcgcm96d2nEhXphbmllLCBrdMOz
cmUgcG9wcnpleiB3eWtvcnp5c3RhbmllIEdQUyBtb25pdG9ydWplIHNhbW9jaG9keSB3IGN6YXNp
ZSByemVjenl3aXN0eW0uIAoKRHppxJlraSB0ZW11IG1vZ8SFIFBhxYRzdHdvIG9kY3p5dHl3YcSH
IHdzemVsa2llIHdhcnRvxZtjaSBkb3R5Y3rEhWNlIG5wLiB6dcW8eWNpYSBwYWxpd2EgY3p5IG9i
cm90w7N3IHNpbG5pa2EuCgpTeXN0ZW0gYXV0b21hdHljem5pZSBnZW5lcnVqZSByb3pidWRvd2Fu
ZSByYXBvcnR5IGkgcG96d2FsYSBkb2tvbnl3YcSHIGlzdG90bnljaCBhbmFsaXouCgpKZcW8ZWxp
IGludGVyZXN1amUgUGHFhHN0d2EgendpxJlrc3plbmllIHd5ZGFqbm/Fm2NpIHByYWN5IGkga29u
dHJvbGEgd3N6ZWxraWNoIHBhcmFtZXRyw7N3IGZsb3R5IC0gcHJvc3rEmSBvIGtvbnRha3QuCgoK
UG96ZHJhd2lhbSwKUmFkb3PFgmF3IEdyYWJvd3NraQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4
LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
