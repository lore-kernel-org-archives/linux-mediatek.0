Return-Path: <SRS0=8HgB=75=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD6C6C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 08:28:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEFFC20739
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 08:28:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vh2nWYRe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gLakXFsI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEFFC20739
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xy07ANBY6eACr0mo0KMIXC18t5CiGYe+j+As4w3dsk8=; b=Vh2nWYReZfBgoB
	+oHGfrvl+g2y1n8KaI9tr1Ae6e1RM8KK1grQcQ/3j7FsaKdMdNa+ZWiz+k9wY5D6SUh/StcL5dteU
	IniIgO7XINvXVjnTau7bRMwrLbMv87EQN8vo47bRkrpqyX/N4O5riE7ihGQG3Wc25N03eZhIMIRMG
	3C2dTjlHGR2Z2O6KDDyv0cAvLc+uI5gx0OfiugqdSts0cE/RLga72GwL5vMf8QrSBvh0k2tCwDq+I
	i+GQvFvuET28ImdtMf8EHDE5hitZSlmdYtc9GTcr3sSC+1zPtmOcUOjaMrgT4RDC6U8hDKhpSmdwP
	+nVc/hd/MIXJZOIxCVdg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jl6x7-0005NE-0p; Tue, 16 Jun 2020 08:28:17 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jl6ww-0005Dr-5U
 for linux-mediatek@lists.infradead.org; Tue, 16 Jun 2020 08:28:07 +0000
Received: by mail-wr1-x442.google.com with SMTP id j10so19776017wrw.8
 for <linux-mediatek@lists.infradead.org>; Tue, 16 Jun 2020 01:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=B3Zvc0+WkJWTmHdueBto0Q5WGj5wxL8G3qgASoBVzNY=;
 b=gLakXFsIC8xZtNwr+XfHP1wnr5SDo5nHecQ4brNe+lN2ChBIsKPXALQeHsIYYaLTXb
 wsvothXzTvUtQKDoSSHmDdiny1LJSckLfw1XnhXhiPAKw/TnCVbjH9L2P5IOgnxLahvD
 5kajvazyTYkm4UxG9dIxiqA2FO1wwGkvejOnt/oVT7h13AdfGubQVmi2NieFR0lX/NIZ
 8YFNuHCvlY3mexZYqrHcvNt2LtxuvNyr43qnliRLp+9Q2uLMZLwNvzMlnLOYbGGjAtXk
 LUUwyneBgVZaLmTSdxo2Gk03Mj5BJVjRjoHyK1UcuXPm70vAq+YgSNDHi9gCE+VEavB+
 5zLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=B3Zvc0+WkJWTmHdueBto0Q5WGj5wxL8G3qgASoBVzNY=;
 b=pHFCxB337EsaIO+dbQ4UOOSjVranIAaxx6MEGTuMvJ66Lyp/Kpt98PdplH988TNmpT
 1OGdI1koG/FayqInREmEVT5MpMVi0+eLPYiFyeptkMfSABMYUdqFY+6GJyapMmCellMJ
 gRhAjnrMi7IdTuXwW4JIXJkYzkvXXor53Xj+D/6qE8ufEt5Us9vgcvsCnqhNnj2whlUP
 9/Clbco8uBMogPhjTfhrwXIKmRya3EiNSk/QI7Bc6uk1e9Mz/5RVtYdkEVKhAkMjyG+8
 35AnuLD+x5wMiYgg8PZZcdvdFr4awPXqmgaHzWT+n/KW71DX4Jw8cy1qpu1vm2CIjbdu
 HYHA==
X-Gm-Message-State: AOAM533Swt4i3YitQS3+EA9z3enQ8TT/iKrbn0uD9lx+FNGGHrrRDcpC
 2hPDZwDV6DXGB5DEJFCmi8TUmA==
X-Google-Smtp-Source: ABdhPJzAvCk0ui/vMtJ+dz/ehjMGM1fOixVzM29fYWpKqQN1QryV19KiL93HTiApPkKVxsAzR5Xljg==
X-Received: by 2002:adf:ea11:: with SMTP id q17mr1748627wrm.75.1592296084603; 
 Tue, 16 Jun 2020 01:28:04 -0700 (PDT)
Received: from dell ([109.180.115.156])
 by smtp.gmail.com with ESMTPSA id z16sm28111508wrm.70.2020.06.16.01.28.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 01:28:03 -0700 (PDT)
Date: Tue, 16 Jun 2020 09:28:02 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH] mfd: mt6360: Fix register driver NULL pointer by add
 driver name
Message-ID: <20200616082802.GM2608702@dell>
References: <1591609125-3761-1-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1591609125-3761-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200616_012806_234799_D79E63C0 
X-CRM114-Status: UNSURE (   7.63  )
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
Cc: gene_chen@richtek.com, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 Wilma.Wu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAwOCBKdW4gMjAyMCwgR2VuZSBDaGVuIHdyb3RlOgoKPiBGcm9tOiBHZW5lIENoZW4g
PGdlbmVfY2hlbkByaWNodGVrLmNvbT4KPiAKPiBhY2NpZGVudGFsbHkgcmVtb3ZlIGRyaXZlciBu
YW1lIHdoZW4KPiByZXBsYWNlIHByb2JlIGJ5IHByb2JlX25ldyBpbiBhZGQgbXQ2MzYwIG1mZCBk
cml2ZXIgcGF0Y2ggdjQKPiAKPiBbICAxMjEuMjQzMDEyXSBFQVg6IGMyYThiYzY0IEVCWDogMDAw
MDAwMDAgRUNYOiAwMDAwMDAwMCBFRFg6IDAwMDAwMDAwCj4gWyAgMTIxLjI0MzAxMl0gRVNJOiBj
MmE4YmM3OSBFREk6IDAwMDAwMDAwIEVCUDogZTU0YmRlYTggRVNQOiBlNTRiZGVhMAo+IFsgIDEy
MS4yNDMwMTJdIERTOiAwMDdiIEVTOiAwMDdiIEZTOiAwMDAwIEdTOiAwMDAwIFNTOiAwMDY4IEVG
TEFHUzogMDAwMTAyODYKPiBbICAxMjEuMjQzMDEyXSBDUjA6IDgwMDUwMDMzIENSMjogMDAwMDAw
MDAgQ1IzOiAwMmVjMzAwMCBDUjQ6IDAwMDAwNmIwCj4gWyAgMTIxLjI0MzAxMl0gQ2FsbCBUcmFj
ZToKPiBbICAxMjEuMjQzMDEyXSAga3NldF9maW5kX29iaisweDNkLzB4YzAKPiBbICAxMjEuMjQz
MDEyXSAgZHJpdmVyX2ZpbmQrMHgxNi8weDQwCj4gWyAgMTIxLjI0MzAxMl0gIGRyaXZlcl9yZWdp
c3RlcisweDQ5LzB4MTAwCj4gWyAgMTIxLjI0MzAxMl0gID8gaTJjX2Zvcl9lYWNoX2RldisweDM5
LzB4NTAKPiBbICAxMjEuMjQzMDEyXSAgPyBfX3Byb2Nlc3NfbmV3X2FkYXB0ZXIrMHgyMC8weDIw
Cj4gWyAgMTIxLjI0MzAxMl0gID8gY2h0X3djX2RyaXZlcl9pbml0KzB4MTEvMHgxMQo+IFsgIDEy
MS4yNDMwMTJdICBpMmNfcmVnaXN0ZXJfZHJpdmVyKzB4MzAvMHg4MAo+IFsgIDEyMS4yNDMwMTJd
ICA/IGludGVsX2xwc3NfcGNpX2RyaXZlcl9pbml0KzB4MTYvMHgxNgo+IFsgIDEyMS4yNDMwMTJd
ICBtdDYzNjBfcG11X2RyaXZlcl9pbml0KzB4Zi8weDExCj4gWyAgMTIxLjI0MzAxMl0gIGRvX29u
ZV9pbml0Y2FsbCsweDMzLzB4MWEwCj4gWyAgMTIxLjI0MzAxMl0gID8gcGFyc2VfYXJncysweDFl
Yi8weDNkMAo+IFsgIDEyMS4yNDMwMTJdICA/IF9fbWlnaHRfc2xlZXArMHgzMS8weDkwCj4gWyAg
MTIxLjI0MzAxMl0gID8ga2VybmVsX2luaXRfZnJlZWFibGUrMHgxMGEvMHgxN2YKPiBbICAxMjEu
MjQzMDEyXSAga2VybmVsX2luaXRfZnJlZWFibGUrMHgxMmMvMHgxN2YKPiBbICAxMjEuMjQzMDEy
XSAgPyByZXN0X2luaXQrMHgxMTAvMHgxMTAKPiBbICAxMjEuMjQzMDEyXSAga2VybmVsX2luaXQr
MHhiLzB4MTAwCj4gWyAgMTIxLjI0MzAxMl0gID8gc2NoZWR1bGVfdGFpbF93cmFwcGVyKzB4OS8w
eGMKPiBbICAxMjEuMjQzMDEyXSAgcmV0X2Zyb21fZm9yaysweDE5LzB4MjQKPiBbICAxMjEuMjQz
MDEyXSBNb2R1bGVzIGxpbmtlZCBpbjoKPiBbICAxMjEuMjQzMDEyXSBDUjI6IDAwMDAwMDAwMDAw
MDAwMDAKPiBbICAxMjEuMjQzMDEyXSByYW5kb206IGdldF9yYW5kb21fYnl0ZXMgY2FsbGVkIGZy
b20gaW5pdF9vb3BzX2lkKzB4M2EvMHg0MCB3aXRoIGNybmdfaW5pdD0wCj4gWyAgMTIxLjI0MzAx
Ml0gLS0tWyBlbmQgdHJhY2UgMzhhODAzNDAwZjFhMmJlZSBdLS0tCj4gWyAgMTIxLjI0MzAxMl0g
RUlQOiBzdHJjbXArMHgxMS8weDMwCj4gCj4gU2lnbmVkLW9mZi1ieTogR2VuZSBDaGVuIDxnZW5l
X2NoZW5AcmljaHRlay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbWZkL210NjM2MC1jb3JlLmMgfCAx
ICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpBcHBsaWVkLCB0aGFua3MuCgot
LSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVhZCAtIERldmVsb3Bl
ciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNv
Q3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
