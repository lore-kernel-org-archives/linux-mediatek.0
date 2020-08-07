Return-Path: <SRS0=9FsO=BR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99EC0C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2020 13:03:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 676EE221E2
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2020 13:03:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xrHq5UbJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="O3Vqmrlv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 676EE221E2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Z44RDR/a8726oMM1pAt3nKaDOlH/qxYyHThHfMokjFI=; b=xrHq5UbJUmov4LHIVbFeNOW2k
	/mNPhzDTLLiWWkKmjH9DfYleBMYP0ZUkgsJYQEzgUZck0PzlshTdCa+NJBv9yf7hYq0WoGhaTHgsC
	jjOO43lOHD2ekq93sJZusD0uKCz808SMflS9AtVZY2t/uOpbI+LPOvXuQFE7gRBXAnGMBloS81Ug4
	/XxmFFWczOKaWTdwarZbRWHjM94HvJKO6CPeffTL6ULm8ZFuoXQMi1LsAmeDXqX2H+tLm8xh0fK+6
	ECTk7zDxXHZibjeYV/wxsVGBKUV5U7Zpo1eDbdGxNGQh6tfbrO3+EuzXugIKXANzxyuUmKeH/GzZS
	RPrcaXp+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k421O-0006nF-4d; Fri, 07 Aug 2020 13:02:54 +0000
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k421G-0006ln-4D
 for linux-mediatek@lists.infradead.org; Fri, 07 Aug 2020 13:02:52 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1596805371; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=mc38/opTEptAuWJc70jptxAnqwYZATU+evTD+ABr2Ms=;
 b=O3Vqmrlvvv4iA/zfMNPT5NcdvnVJS2NtJ121DaPzJy1tvEalu983JbMWho52/chhYi9SCjI2
 8H5QP5myI1euvUcaAsE3KyM/d1VDlElmDi/kuIgxCkqi0qM21+sb3MzFj4szEAGKqiJu8dvY
 2TUQJe9ibHtKlLT7fxb9gUi8SHs=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n16.prod.us-east-1.postgun.com with SMTP id
 5f2d50bccbcd42bdeee28ac9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 07 Aug 2020 13:01:48
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5A6FDC433AF; Fri,  7 Aug 2020 13:01:46 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 856CCC433C9;
 Fri,  7 Aug 2020 13:01:45 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 07 Aug 2020 21:01:45 +0800
From: Can Guo <cang@codeaurora.org>
To: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH 9/9] scsi: ufs: Properly release resources if a task is
 aborted successfully
In-Reply-To: <a752927b-dd9b-ebf0-8c77-e2ae0b2aa475@web.de>
References: <a752927b-dd9b-ebf0-8c77-e2ae0b2aa475@web.de>
Message-ID: <fc5c328732792aca1dd451d0109f00b5@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200807_090252_066980_29E86BE0 
X-CRM114-Status: UNSURE (   9.29  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rajendra Nayak <rnayak@codeaurora.org>, Bart Van Assche <bvanassche@acm.org>,
 linux-scsi@vger.kernel.org, Saravana Kannan <saravanak@google.com>,
 "James E. J. Bottomley" <jejb@linux.ibm.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Bao D. Nguyen" <nguyenb@codeaurora.org>,
 Avri Altman <avri.altman@wdc.com>, Mark Salyzyn <salyzyn@google.com>,
 linux-mediatek@lists.infradead.org, Hongwu Su <hongwus@codeaurora.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Bean Huo <beanhuo@micron.com>, Stanley Chu <stanley.chu@mediatek.com>,
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
 Asutosh Das <asutoshd@codeaurora.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgTWFya3VzLAoKT24gMjAyMC0wOC0wNyAxNzozMywgTWFya3VzIEVsZnJpbmcgd3JvdGU6Cj4+
IOKApiBUbyBmaXggaXQsIOKApgo+IAo+IEkgcHJvcG9zZSB0byByZXBsYWNlIHRoaXMgd29yZGlu
ZyBieSB0aGUgdGFnIOKAnEZpeGVz4oCdLgo+IAo+IAo+PiDigKYgIm1hbm51YWxseSIsIOKApgo+
IAo+IFBsZWFzZSBhdm9pZCBhIHR5cG86Cj4g4oCmICJtYW51YWxseSIsIOKApgo+IAo+IAo+IFJl
Z2FyZHMsCj4gTWFya3VzCgpUaGFua3MsIHdpbGwgZml4IHRoZXNlIGluIG5leHQgdmVyc2lvbi4K
ClJlZ2FyZHMsCkNhbiBHdW8uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW1lZGlhdGVrCg==
