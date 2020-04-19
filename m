Return-Path: <SRS0=IGbo=6D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D84AAC2BA19
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Apr 2020 01:33:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA10021927
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Apr 2020 01:33:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RhKS8RBl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="EmTgeneE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA10021927
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fAn10Yns0u8CvsxqoZcDd2Fny6kB5Vzq4sWhdVLM1ao=; b=RhKS8RBl/Addoz
	qgVGHR5Sgif8nuFHCH47Ut9yWiB9S25+MkBRj9qGGKMEkBngygteyYb9cMOLUXT2girkOJDoCi26k
	dAX+S6wcXYlxw4yxY7e1m24p5t7YmwDcMUKBY21l+m6yUNC5qyoAq0/O8uqZeizMwGK6E/7E88ljA
	gN7r9eo56fXfx39IGqd0kv/aPdVmjb1f7bFkYQYVj+fV7Tc9NeyBGHSzdrmwEfZ8z6ulQDCgcQ+qC
	fL3Y+c95QW1QbQq1VKhWKOisBhzK7FzQ3dkBY9Ryw56hH6CqPIlGrewAI6rOAdR1xA5QuM4ovhawO
	VAJ8AvzCHeSJcXff6YAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPypn-0003lm-R3; Sun, 19 Apr 2020 01:33:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPypa-0003cT-Rk; Sun, 19 Apr 2020 01:33:12 +0000
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EA17B21D93;
 Sun, 19 Apr 2020 01:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587259990;
 bh=/UcjrPZXCXuph9J2Yc5mQBEB5sWwMAN0uuROLhyfxok=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=EmTgeneEXBXbi3HUis7BKU6v4ye9Tk4FdREG8sJL0+EHg9HvNZ2I/IfV8plCZJ2Y4
 m6hsI/jx17Vf1JvLM8P6kOrmdDLJ4hZG3CmHNjtnHi8zi8S4Qrp3nff0jXiVcmd0KE
 nSrAvZxKb/vUpyZikkXL4HYV0lnipdTd2sQjn8ZM=
Received: by mail-ej1-f41.google.com with SMTP id q8so4832483eja.2;
 Sat, 18 Apr 2020 18:33:09 -0700 (PDT)
X-Gm-Message-State: AGi0PuY3AItaYbMwob4u+8AOlXVzvjelQK1qTeYV2cHq1oRLiRCEn7dy
 BIQ9/LWt/bAvzJTar449AzxQ/Ga1mJp7rpZ94A==
X-Google-Smtp-Source: APiQypI3giH/gDy/cHj5eO3uMu9u4Kz+9zinLfCvMPB/K9QM30cqtMHT04YZTWUcv0gCaVxOevmWmBWBze6mbHrY5R4=
X-Received: by 2002:a17:906:4bc3:: with SMTP id
 x3mr10131749ejv.38.1587259988344; 
 Sat, 18 Apr 2020 18:33:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200411074408.38090-1-jitao.shi@mediatek.com>
 <20200411074408.38090-2-jitao.shi@mediatek.com>
In-Reply-To: <20200411074408.38090-2-jitao.shi@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 19 Apr 2020 09:32:55 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9YThRHNqv-D7o-XrgqQ6CnH0tvmPCHppDpzmiiT0KEGg@mail.gmail.com>
Message-ID: <CAAOTY_9YThRHNqv-D7o-XrgqQ6CnH0tvmPCHppDpzmiiT0KEGg@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] dt-bindings: display: mediatek: add property to
 control mipi tx drive current
To: Jitao Shi <jitao.shi@mediatek.com>, Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200418_183310_941363_8AA2DFFD 
X-CRM114-Status: GOOD (  13.72  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, cawa.cheng@mediatek.com,
 CK Hu <ck.hu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFJvYjoKCkhvdyBkbyB5b3UgdGhpbmsgYWJvdXQgdGhpcyBwYXRjaD8gVGhpcyBwYXRjaCBs
b29rcyBnb29kIHRvIG1lLgoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCkppdGFvIFNoaSA8aml0YW8u
c2hpQG1lZGlhdGVrLmNvbT4g5pa8IDIwMjDlubQ05pyIMTHml6Ug6YCx5YWtIOS4i+WNiDM6NDTl
r6vpgZPvvJoKPgo+IEFkZCBhIHByb3BlcnR5IHRvIGNvbnRyb2wgbWlwaSB0eCBkcml2ZSBjdXJy
ZW50Ogo+ICJkcml2ZS1zdHJlbmd0aC1taWNyb2FtcCIKPgo+IFJldmlld2VkLWJ5OiBDaHVuLUt1
YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBKaXRhbyBT
aGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHNpLnR4dCAgICB8IDUgKysrKysKPiAgMSBm
aWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRzaS50eHQg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRp
YXRlayxkc2kudHh0Cj4gaW5kZXggYTE5YTZjYzM3NWVkLi5kNzhiNmQ2ZDhmYWIgMTAwNjQ0Cj4g
LS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsv
bWVkaWF0ZWssZHNpLnR4dAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRzaS50eHQKPiBAQCAtMzMsNiArMzMsMTAgQEAg
UmVxdWlyZWQgcHJvcGVydGllczoKPiAgLSAjY2xvY2stY2VsbHM6IG11c3QgYmUgPDA+Owo+ICAt
ICNwaHktY2VsbHM6IG11c3QgYmUgPDA+Lgo+Cj4gK09wdGlvbmFsIHByb3BlcnRpZXM6Cj4gKy0g
ZHJpdmUtc3RyZW5ndGgtbWljcm9hbXA6IGFkanVzdCBkcml2aW5nIGN1cnJlbnQsIHNob3VsZCBi
ZSAzMDAwIH4gNjAwMC4gQW5kCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdGhlIHN0ZXAgaXMgMjAwLgo+ICsKPiAgRXhhbXBsZToKPgo+ICBtaXBp
X3R4MDogbWlwaS1kcGh5QDEwMjE1MDAwIHsKPiBAQCAtNDIsNiArNDYsNyBAQCBtaXBpX3R4MDog
bWlwaS1kcGh5QDEwMjE1MDAwIHsKPiAgICAgICAgIGNsb2NrLW91dHB1dC1uYW1lcyA9ICJtaXBp
X3R4MF9wbGwiOwo+ICAgICAgICAgI2Nsb2NrLWNlbGxzID0gPDA+Owo+ICAgICAgICAgI3BoeS1j
ZWxscyA9IDwwPjsKPiArICAgICAgIGRyaXZlLXN0cmVuZ3RoLW1pY3JvYW1wID0gPDQ2MDA+Owo+
ICB9Owo+Cj4gIGRzaTA6IGRzaUAxNDAxYjAwMCB7Cj4gLS0KPiAyLjIxLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxp
bmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
