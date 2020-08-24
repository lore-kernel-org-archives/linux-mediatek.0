Return-Path: <SRS0=7UDR=CC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A65A0C433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2020 07:22:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 717D720767
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2020 07:22:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NIqsgFqE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KHA8P/9i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 717D720767
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AJ1yBETnd7jjryznLTLlFZNfuX1xm+soxQs3sXucHYg=; b=NIqsgFqEIqibVrEnZrCAsyE6q
	1H7enQict3G3sX7G/THyZIIFWb0KXXFTaSiO3ypfuDzZRnxqOtNypQ4i0N5cztbMEojLM8K2G2yY1
	OjFPH6N1GsDX0zfce3H+OKoBWdtH7OUlVIkDUrF7ognT1lL9XF4/CI9Wnoefryc04gAZrnbd0L47B
	UhM5RJo5ESuA22ya5DlzlbIBwKm9FiazIxy2f9oEkxoeYptmqcwJF7FAk0eWK756tgsPtmRLZKJ4Y
	baU+veD2igiKlHRXmmmjeL3AOOqBQVTuS8wuMSEv463kwuRNiRef0JzabirhqY5o/1xe3mqK6LZUm
	FqThCNFIg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kA6o4-0004KW-7A; Mon, 24 Aug 2020 07:22:16 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kA6nz-0004Iy-P4; Mon, 24 Aug 2020 07:22:12 +0000
Received: by mail-io1-xd41.google.com with SMTP id b16so7643522ioj.4;
 Mon, 24 Aug 2020 00:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wURU5CfyuxeoiAiYavrkiUF7W5jzEOVatHlGY5b9gAQ=;
 b=KHA8P/9ihR89353Mtkzi/vVjvBcx53K3IXfueYKDlkg/QsU4ejz37+W1Qkr21BTuQO
 uarEanWspS+m4mrc29EEHBFYViYwC5LcntKr+HX+TIxj8zSJTTZUooZQAmzo2OkULEkF
 HaT4zLagzVpbGGTGXsNK2hyJKh4tIQVaQlxbJiojEhP5LTVoygt34t2J/bv1ZUap4Ijd
 isKG8e8XNwf5bStU8wTnS5FwC5rE+1twCqB7acg5rSvMgHM/Et+m7INu/s4GpmVhqJpK
 7nO57UAhsUlXHiYbXd57ywY6/Ag0kzdytffxOH6dFjqWG9McB95EfT7JBk9fcKXcvimQ
 aK8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wURU5CfyuxeoiAiYavrkiUF7W5jzEOVatHlGY5b9gAQ=;
 b=DejNAS0wAW6Zc/78uiu394KwMpgg3Ys8+Vgif+mr/a4oIaGsrPyCpWbhWARc/vhH1p
 hSLOpl4lVdV8hdhV2QrewWSkWG2vpbauieINZ/4lHfqsZQaL4RkvQC4QZMgNeFbYIFRy
 8+tG1cBVdz04rTVkFSin+hEBTna3l/rdllt60A5ZRR/IdEBVPtaGfHDcUQS27hdVOcgW
 567h+UrGs8AuIh1LlUb38ieKSjm1Hvc2965oxlO1sOp4ccTQlNm8c3PVLrqIqdgLTpy/
 aJshBQJi1ngYe5LlSjb32yvKQ8ybLu96/CqjlguFJ17UPnuNxsTT1MLzbs//AtyUDEZE
 JNeA==
X-Gm-Message-State: AOAM532SZJSfpk8pRXLahvvLaAz6szM2ecmFgU9DoxOf2myAEB0fh5Nb
 GnyS903wDD5qGXgRx6rUsLkfqbKum2ftikvizeM=
X-Google-Smtp-Source: ABdhPJyIuC2hH0bMEkHUPoarTiWp84gpsTAg9EGOmVfRzmTGMZ8A+G1fLCxwQ3GK4nI52FU0ZMjkUMBCMELoFMhkp5k=
X-Received: by 2002:a05:6638:1489:: with SMTP id
 j9mr4514597jak.22.1598253728521; 
 Mon, 24 Aug 2020 00:22:08 -0700 (PDT)
MIME-Version: 1.0
References: <1597910022-22617-1-git-send-email-gene.chen.richtek@gmail.com>
 <1597910022-22617-3-git-send-email-gene.chen.richtek@gmail.com>
 <20200820113015.GB5854@sirena.org.uk>
In-Reply-To: <20200820113015.GB5854@sirena.org.uk>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Mon, 24 Aug 2020 15:21:57 +0800
Message-ID: <CAE+NS36C0AwbrFJdYGY6_n_g3DVitp_e1GfZUxjMbKu1bJ_t4w@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] regulator: mt6360: Add DT binding documentation
To: Mark Brown <broonie@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_032211_874868_D00747C7 
X-CRM114-Status: UNSURE (   8.19  )
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
Cc: Gene Chen <gene_chen@richtek.com>, devicetree@vger.kernel.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

4oqVCgpNYXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5vcmc+IOaWvCAyMDIw5bm0OOaciDIw5pel
IOmAseWbmyDkuIvljYg3OjMw5a+r6YGT77yaCj4KPiBPbiBUaHUsIEF1ZyAyMCwgMjAyMCBhdCAw
Mzo1Mzo0MlBNICswODAwLCBHZW5lIENoZW4gd3JvdGU6Cj4KPiA+ICtwcm9wZXJ0aWVzOgo+ID4g
KyAgY29tcGF0aWJsZToKPiA+ICsgICAgY29uc3Q6IG1lZGlhdGVrLG10NjM2MC1yZWd1bGF0b3IK
PiA+ICsKPiA+ICsgIExET19WSU4zLXN1cHBseToKPiA+ICsgICAgZGVzY3JpcHRpb246IElucHV0
IHN1cHBseSBwaGFuZGxlKHMpIGZvciBMRE8zCj4gPiArCj4KPiBPbmx5IExETzMgbmVlZHMgYSBz
dXBwbHk/CgpMRE9fVklOMS9MRE9fVklOMiBpcyByZWFsIE1UNjM2MCBwaW4gc3VwcGx5IGZyb20g
VlNZUyB0byBMRE8xLzIvMy81CkxET19WSU4zIGlzIGFsc28gcmVhbCBwaW4gc3VwcGx5IGZyb20g
QlVDSzIgdG8gTERPNi83CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW1lZGlhdGVrCg==
