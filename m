Return-Path: <SRS0=rcQv=JN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD3EDC433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 06:05:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D27561166
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 06:05:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D27561166
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=T7QHj9nhi9u2iwvwinAZV/r3d5SiBvTghfGIOViqk3g=; b=UU4YgOA07RIXlOqvEU/XB21q9
	s5vRLbmHbn1P+6cRTxnKL/O0UqiV/sgfmdQFGivBjxHHfKyx7DNZNup5AzR0h8kcpVqH+sCTcLs/m
	xZyst/1YCInvnnpz8d+Q4kdzUZrQ6TAyqj6KY0nVu02a62w0zHorCkIdZk8vCSB5xTGh5W3k3qN2F
	ye0fVLBBAafWD5DgxE/BASrKFceBZyjvBSIXH+9Ux7540wGm6Sd3B62XnZJsclsdTLHjtMpBcAuik
	hmH45kk+qFTjbqEldHG3e+IqHTEwxI4I8pvNeUPiau+wdh+opyzFuYKB409/ZtTyqh9I6JpMiEJR6
	PkAt3A0Wg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXHbV-000wy7-7K; Fri, 16 Apr 2021 06:05:21 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXHTx-000vlH-2m; Fri, 16 Apr 2021 05:57:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=VOrqlTV3huhMCZAEQIUjiZ90jLDEUdTRF16U+SVEFXQ=; b=r8rWLg7h38ddGzLZJmA+gw82dc
 pGk8uSjdZRqeuHjVvHSdxs2Ryb+wlkuZoTnP4YpzoGJiWxOErjkIojbsYz4wRABXdQ4PNw7WEVT+q
 ko2TSvKd+NJOm3jUIjr34C2eGc5cIjFrhDuT1Xza2B0z8Btk2lYOWoRPLXQA0ND8NT1St6dZS69ox
 ih2V7tY7oedfOGMPXrPPSnrtha0kxHFHrb4qzFTOhj6BQLRVq1Tc2Z53hMRIkloPJyhMpQDFHps99
 9rcIwzIeIu3NH0gQDzzlBigClEqg14xnq1ui533IeTTkMWIAop16dEM/9hl8+ooKmXd8KQb5EsNf/
 hNMKT/5w==;
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXHTu-0096I7-HH; Fri, 16 Apr 2021 05:57:31 +0000
Received: by mail-ot1-x32f.google.com with SMTP id
 t17-20020a9d77510000b0290287a5143b41so13551669otl.11; 
 Thu, 15 Apr 2021 22:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VOrqlTV3huhMCZAEQIUjiZ90jLDEUdTRF16U+SVEFXQ=;
 b=jexlo7/S3quht6cy3pccZK2RvurXcNQ44ooeJISi79+SnQlWssMxWESqTHHWbc6sQo
 PswkbUSDKQkiFGRYtpYXEoOfyQH2tx+7PuxGpp58hJaeCYEJVdRWNT1ZMzA/ZnOkmDpU
 yXE6WR64gFQHEqUZLjP878bo1QEhaPBbkQDOGCka7TbnoYoHysBSUcyrKEll5go206cD
 tMfN0Ce2EwueHeoQipNL9A2y5UWiorgU9ISqrx6pMflLSMNXAqArtVM16qiMxAjgHOdL
 +yUCBUkRw2UM7FC9HJ4t4eVcJ0p/qDuWr0WxVOEO4eO5SGPAruEeAKk925xMETooeIJt
 VRNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VOrqlTV3huhMCZAEQIUjiZ90jLDEUdTRF16U+SVEFXQ=;
 b=fd7c3ktYq8lC0aXtZgJaUJvL+fJ6/QwS06yMvST4HMr7MuJ8WFW1ky3nBAq+pHIGAy
 5nbg2R8VIjjOLHTmuOphzslIay69wklzx43fACmmWg3a3zxa+RPsgqOoVhS7USqMk3r7
 es5trwIvUF5dyRrxTLJfrna89lf523GthaLoqSV41OqV2kIDTEiVCq2W0OdTUCfMe+lN
 dxej/HsaA3bBf0V7hD9V96PrqmybA/MHsqNuJhp8zhkEhFzyT+B4lrUgBPIGSYmAlQFa
 +QQfFMbHKN89fwz19FWBkVzF9EVYBdRIqQ8F4FIGWyOO/UJ7m/mIHnqP61zJ1c9CsUgn
 kjpg==
X-Gm-Message-State: AOAM532x8fusER/7mxe4eL9AVuJVo33X8hY4UXpfDb9ilRNa0hSmIRg1
 fqkLaSN6by2NQEvxipEvdRbz/Iodpuc0MCVrDzI=
X-Google-Smtp-Source: ABdhPJybkHaFhC1kho6OSz3Hq35NUakGJLmB47r7+Qw4hTh5gx6Nq2tu2N4OETGP9bH+nc/s5N9we1lRNaE/fEZI1CU=
X-Received: by 2002:a05:6830:1398:: with SMTP id
 d24mr2489846otq.281.1618552649627; 
 Thu, 15 Apr 2021 22:57:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210415093519.1920877-1-hsinyi@chromium.org>
 <20210415093519.1920877-3-hsinyi@chromium.org>
In-Reply-To: <20210415093519.1920877-3-hsinyi@chromium.org>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Fri, 16 Apr 2021 07:57:21 +0200
Message-ID: <CAFqH_50725CK30jWksqDxvKFUuGdsS4MOtFK58Kqhi7-vcGg9A@mail.gmail.com>
Subject: Re: [PATCH 3/8] dt-bindings: arm64: dts: mediatek: Add
 mt8183-kukui-jacuzzi-burnet
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Sean Wang <sean.wang@mediatek.com>, Ben Ho <Ben.Ho@mediatek.com>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_225730_591728_3EC5DC85 
X-CRM114-Status: GOOD (  13.92  )
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

SGkgSHNpbi1ZaSwKClRoYW5rIHlvdSBmb3IgeW91ciBwYXRjaC4KCk1pc3NhdGdlIGRlIEhzaW4t
WWkgV2FuZyA8aHNpbnlpQGNocm9taXVtLm9yZz4gZGVsIGRpYSBkai4sIDE1IGTigJlhYnIuCjIw
MjEgYSBsZXMgMTE6MzY6Cj4KPiBCdXJuZXQgaXMga25vd24gYXMgSFAgQ2hyb21lYm9vayB4MzYw
IDExTUsgRzMgRUUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBIc2luLVlpIFdhbmcgPGhzaW55aUBjaHJv
bWl1bS5vcmc+CgpSZXZpZXdlZC1ieTogRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFs
bGV0Ym9AY29sbGFib3JhLmNvbT4KCj4gLS0tCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9hcm0vbWVkaWF0ZWsueWFtbCB8IDQgKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2FybS9tZWRpYXRlay55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2FybS9tZWRpYXRlay55YW1sCj4gaW5kZXggOTZjNDAxNTk3YmQ4Li4wODcwNDkwYWEzNTAg
MTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9tZWRp
YXRlay55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9t
ZWRpYXRlay55YW1sCj4gQEAgLTEyMiw2ICsxMjIsMTAgQEAgcHJvcGVydGllczoKPiAgICAgICAg
ICAgIC0gZW51bToKPiAgICAgICAgICAgICAgICAtIG1lZGlhdGVrLG10ODE5NS1ldmIKPiAgICAg
ICAgICAgIC0gY29uc3Q6IG1lZGlhdGVrLG10ODE5NQo+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBH
b29nbGUgQnVybmV0IChIUCBDaHJvbWVib29rIHgzNjAgMTFNSyBHMyBFRSkKPiArICAgICAgICBp
dGVtczoKPiArICAgICAgICAgIC0gY29uc3Q6IGdvb2dsZSxidXJuZXQKPiArICAgICAgICAgIC0g
Y29uc3Q6IG1lZGlhdGVrLG10ODE4Mwo+ICAgICAgICAtIGRlc2NyaXB0aW9uOiBHb29nbGUgS3Jh
bmUgKExlbm92byBJZGVhUGFkIER1ZXQsIDEwZSwuLi4pCj4gICAgICAgICAgaXRlbXM6Cj4gICAg
ICAgICAgICAtIGVudW06Cj4gLS0KPiAyLjMxLjEuMjk1Lmc5ZWE0NWI2MWI4LWdvb2cKPgo+Cj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1t
ZWRpYXRlayBtYWlsaW5nIGxpc3QKPiBMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRp
YXRlawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRp
YXRlawo=
