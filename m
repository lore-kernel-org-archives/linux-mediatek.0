Return-Path: <SRS0=9rwW=7E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF76FC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 May 2020 10:11:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E9FF205CB
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 May 2020 10:11:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nHCJTiqU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="dR5wbfMQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E9FF205CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=auQ859j+8ubZ4kxp39IYvVJKdQb938JG4B8uuWDAAoA=; b=nHCJTiqULnKwp1
	Gi0/Ez5Q8i1gTHhUuEOYO0H7FnVwYblcDnNLAHwTtH8LAXkbhrlAQ7+8jQ3d4ynnS15nzVX30SGwx
	pwD4ZhBYnOAaUIVQ5ADNZbJgFBo/p9nShkVXN036JYNnE+gh8GwwLrLd4NlwlGfE8RKhN//Ev7GUp
	VINhZq/bzBqLkSXo5CyU1nTy5VElBH6WmjPy7GZ48xw1mhG7ixECX3SblBjRzqSts58ZWlygUR/R+
	8R/pQuk5shENMUd5+PMhgzfi5ZtYvClK7fjd4gunUa4YU03qG4riCL5AtXbvaDmKs+dUwCSwDx8gS
	q0iVSNbcRY5xFefTJotg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jc4eV-0001VJ-Rw; Fri, 22 May 2020 10:11:43 +0000
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jc4eQ-0001UZ-BB
 for linux-mediatek@lists.infradead.org; Fri, 22 May 2020 10:11:43 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1590142301; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: In-Reply-To: Date: References: Subject: Cc:
 To: From: Sender; bh=NW8Jsqkb6pnbBs1zr+nqGOErhbAaUKt/K4f9G+vJyjQ=;
 b=dR5wbfMQS4WM/3XICegkmMXplMn/Uu/rQ2x/owhbF4ehSkoeJ2ITOkNBdlpHUTnpA3B7Uq9l
 fWSz4ul47JMTjj7pQ+wmUYMDHs7dVcgUYFauxMVQlRJwIiaGwzBlp6P+FuEKSWbAo0eeRyWE
 veTgH3Rxt1jgHW+V2sP2ymcIMPU=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5ec7a54f569a62550d9406f1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 22 May 2020 10:11:27
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D87CDC433CA; Fri, 22 May 2020 10:11:27 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id DB89FC433C8;
 Fri, 22 May 2020 10:11:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DB89FC433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH -next] mt76: mt7915: Fix build error
References: <20200522034533.61716-1-yuehaibing@huawei.com>
Date: Fri, 22 May 2020 13:11:16 +0300
In-Reply-To: <20200522034533.61716-1-yuehaibing@huawei.com>
 (yuehaibing@huawei.com's message of "Fri, 22 May 2020 11:45:33 +0800")
Message-ID: <87a720b7p7.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200522_031141_834516_37411EF1 
X-CRM114-Status: GOOD (  10.51  )
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
Cc: ryder.lee@mediatek.com, linux-wireless@vger.kernel.org, yf.luo@mediatek.com,
 chih-min.chen@mediatek.com, linux-kernel@vger.kernel.org,
 matthias.bgg@gmail.com, yiwei.chung@mediatek.com,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 lorenzo.bianconi83@gmail.com, kuba@kernel.org, shayne.chen@mediatek.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org, nbd@nbd.name
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

WXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPiB3cml0ZXM6Cgo+IEluIGZpbGUgaW5j
bHVkZWQgZnJvbSAuL2luY2x1ZGUvbGludXgvZmlybXdhcmUuaDo2OjAsCj4gICAgICAgICAgICAg
ICAgICBmcm9tIGRyaXZlcnMvbmV0L3dpcmVsZXNzL21lZGlhdGVrL210NzYvbXQ3OTE1L21jdS5j
OjQ6Cj4gSW4gZnVuY3Rpb24g4oCYX19tdDc5MTVfbWN1X21zZ19zZW5k4oCZLAo+ICAgICBpbmxp
bmVkIGZyb20g4oCYbXQ3OTE1X21jdV9zZW5kX21lc3NhZ2XigJkgYXQgZHJpdmVycy9uZXQvd2ly
ZWxlc3MvbWVkaWF0ZWsvbXQ3Ni9tdDc5MTUvbWN1LmM6MzcwOjY6Cj4gLi9pbmNsdWRlL2xpbnV4
L2NvbXBpbGVyLmg6Mzk2OjM4OiBlcnJvcjogY2FsbCB0byDigJhfX2NvbXBpbGV0aW1lX2Fzc2Vy
dF81NDXigJkgZGVjbGFyZWQgd2l0aCBhdHRyaWJ1dGUgZXJyb3I6IEJVSUxEX0JVR19PTiBmYWls
ZWQ6IGNtZCA9PSBNQ1VfRVhUX0NNRF9FRlVTRV9BQ0NFU1MgJiYgbWN1X3R4ZC0+c2V0X3F1ZXJ5
ICE9IE1DVV9RX1FVRVJZCj4gICBfY29tcGlsZXRpbWVfYXNzZXJ0KGNvbmRpdGlvbiwgbXNnLCBf
X2NvbXBpbGV0aW1lX2Fzc2VydF8sIF9fQ09VTlRFUl9fKQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXgo+IC4vaW5jbHVkZS9saW51eC9jb21waWxlci5oOjM3Nzo0OiBu
b3RlOiBpbiBkZWZpbml0aW9uIG9mIG1hY3JvIOKAmF9fY29tcGlsZXRpbWVfYXNzZXJ04oCZCj4g
ICAgIHByZWZpeCAjIyBzdWZmaXgoKTsgICAgXAo+ICAgICBefn5+fn4KPiAuL2luY2x1ZGUvbGlu
dXgvY29tcGlsZXIuaDozOTY6Mjogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmF9jb21w
aWxldGltZV9hc3NlcnTigJkKPiAgIF9jb21waWxldGltZV9hc3NlcnQoY29uZGl0aW9uLCBtc2cs
IF9fY29tcGlsZXRpbWVfYXNzZXJ0XywgX19DT1VOVEVSX18pCj4gICBefn5+fn5+fn5+fn5+fn5+
fn5+Cj4gLi9pbmNsdWRlL2xpbnV4L2J1aWxkX2J1Zy5oOjM5OjM3OiBub3RlOiBpbiBleHBhbnNp
b24gb2YgbWFjcm8g4oCYY29tcGlsZXRpbWVfYXNzZXJ04oCZCj4gICNkZWZpbmUgQlVJTERfQlVH
X09OX01TRyhjb25kLCBtc2cpIGNvbXBpbGV0aW1lX2Fzc2VydCghKGNvbmQpLCBtc2cpCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fgo+IC4v
aW5jbHVkZS9saW51eC9idWlsZF9idWcuaDo1MDoyOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFj
cm8g4oCYQlVJTERfQlVHX09OX01TR+KAmQo+ICAgQlVJTERfQlVHX09OX01TRyhjb25kaXRpb24s
ICJCVUlMRF9CVUdfT04gZmFpbGVkOiAiICNjb25kaXRpb24pCj4gICBefn5+fn5+fn5+fn5+fn5+
Cj4gZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsvbXQ3Ni9tdDc5MTUvbWN1LmM6MjgwOjI6
IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhCVUlMRF9CVUdfT07igJkKPiAgIEJVSUxE
X0JVR19PTihjbWQgPT0gTUNVX0VYVF9DTURfRUZVU0VfQUNDRVNTICYmCj4gICBefn5+fn5+fn5+
fn4KPgo+IEJVSUxEX0JVR19PTiBpcyBtZWFuaW5nbGVzcyBoZXJlLCBjaGFuZyBpdCB0byBXQVJO
X09OLgo+Cj4gRml4ZXM6IGU1N2I3OTAxNDY5ZiAoIm10NzY6IGFkZCBtYWM4MDIxMSBkcml2ZXIg
Zm9yIE1UNzkxNSBQQ0llLWJhc2VkIGNoaXBzZXRzIikKPiBTaWduZWQtb2ZmLWJ5OiBZdWVIYWli
aW5nIDx5dWVoYWliaW5nQGh1YXdlaS5jb20+CgpJJ20gY3VyaW91cyB3aHkgSSBkb24ndCBzZWUg
dGhpcyBidWlsZCBlcnJvcj8gSSB3YXMgYWJvdXQgdG8gc2VuZCBhIHB1bGwKcmVxdWVzdCB0byBE
YXZlLCBzaG91bGQgSSBob2xkIG9mZiB0aGUgcHVsbCByZXF1ZXN0IGR1ZSB0byB0aGlzIHByb2Js
ZW0/CgotLSAKaHR0cHM6Ly93aXJlbGVzcy53aWtpLmtlcm5lbC5vcmcvZW4vZGV2ZWxvcGVycy9k
b2N1bWVudGF0aW9uL3N1Ym1pdHRpbmdwYXRjaGVzCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgt
bWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
