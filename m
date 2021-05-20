Return-Path: <SRS0=cSMM=KP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E82A2C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 13:55:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 732BD60FF3
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 13:55:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 732BD60FF3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=33GxIpOeJGbDAu7Xol7IheS88yZyinoWRZS4NVuAilk=; b=dPiHp3qWnSyc8Hd260iMIjn6oH
	jkSbyehe8oi6sLyEDWy9xXNxqql8pxDqbWSz74s8MUKtiC33kFLoMhed6vlP+SXNn5PVzFFm9MwkS
	JdmZKqV7m/AGNNgzZJlXcjBFXtYyUjfgnWfy5Fkod41a49Wsi2AaGhe+1qPKF/05psMak5GPU/a/6
	WeS9QDI5gbfaIbBrlS549CjUsRq+Cjgtq2uD9cn6fITvbVXgv0SXZfZ9ZTBcMHZ7E5W8uGUoDl4pi
	oBe7OiYU7AU7s0uKOChlZoToV28t0dTi278wqvOaGbfc7bnXAM2CHI1hq9o6/eXi3RcJ0Nz084wd9
	KYPvfJgQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljj9E-001J37-Pr; Thu, 20 May 2021 13:55:36 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljj91-001J0S-Im; Thu, 20 May 2021 13:55:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=kxtcShnR4fpUjqDaEgBJYEGF8sbXlhk7b1s7ImUtLjM=; b=HOs/8FZnG2WPGi0FJ4V5o1HovW
 uKTczqfNRElayygnNJOox6/lSHQyjLcrH7Us9iCb2WBmnGFfSs7sosrJkG5r1Z0rzVGWpHYygxriS
 vsyxDCA12Rt8OXyKtR+NDxV/cwyL14Y0yqJp+yV+M103kJiLSTJz9aHCpu7jje8RDDTjjJgksuf0x
 zLZZlxZBqP86cq/JFkAMAD8FpJSiQ54s7XI3aRQgrCWrRNwSyzT138e4ZiND38pALUZ5wd5qKi2OO
 PDoh1hGKJr2O+HmTULfCazpBBlfgYdACKxHbz+TKMhO5N6Es+1fY86eWaUVqOEehgIxkKVaKyHKh9
 gY9UrQAg==;
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljj8v-00GOR6-Hh; Thu, 20 May 2021 13:55:22 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 b15-20020a17090a550fb029015dad75163dso5337061pji.0; 
 Thu, 20 May 2021 06:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kxtcShnR4fpUjqDaEgBJYEGF8sbXlhk7b1s7ImUtLjM=;
 b=E4I69EpcwEjDBlR279V9//Ag7yQZPuvVOWJKTpmUYjDtyHqpl9Jnkc6aG+J+IKtlbv
 c3JGg/D7C2HnwXpw0W0maJ4DQxEDA4VuBTzEac4vVCs82kvQDmQg0ozxqvYiut6G2Gf5
 6a1GQJwgXUoL5YWsV3s1zbAnqjE9qSOL3WC3Vwbg74gv0CIJzHCXPvqHjuxr44HCn9Hp
 amVldq672VVxORU+1rCglrMj5ZgoP87Ubv6AXWRBpuzuVp5mlcreEo/BlMFwcwyEEWVp
 yG4cX9VxDE3ccZ9J39YjGVyr8tWsPpi6IuOp7ygeIJAyhNE+ZDur4gptX2LpZ3X4YZBi
 YWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kxtcShnR4fpUjqDaEgBJYEGF8sbXlhk7b1s7ImUtLjM=;
 b=SW5eQVuo8ZczdyCbjoaWILuOA9MRZtIs5sPKu0BZQXKoBUOTIldm+TCl2zOVQrUVjs
 DilV8CXpxLeuNV+lvx16AjSn7SuBaeLDrQYV4VTsJeG/ndFPHr7IncmcBBPrtUYVshbt
 xwLqw4THNOi/UXW9XLPjAc12Z2/7/wNlkLihc2KsqUEvVIzE+yaA+8EoqVww6sd013MC
 4stnor0y/0GboGaB/793OGUKC5s2fJ1lPYknfhbYtzAWzn/W59aJfKP481AY0yvsLB3l
 Rlc+E+ZfbhilUPdWIsmmWnN1qO7w0xzku4eniiPHHYK8SitxFBELxSRT38Su2hq+V1RV
 rFWg==
X-Gm-Message-State: AOAM531CW5JUo+MZz0GgebN3psPfTrx87gf3tNYTPoOCsWoKAS4XkabL
 b6ahMjIZBtx/uWhcrgcrTd6A8cowfq9zSNih4Sk=
X-Google-Smtp-Source: ABdhPJy3BzTnhaqsq0tYiKlRnvgZddzTH1DlQBhAMf3srr+VQ8wJl2BaTPwmIZCr37rCXBt/jIWtKxwIlBYi/r4qN20=
X-Received: by 2002:a17:90a:ab0c:: with SMTP id
 m12mr4948115pjq.179.1621518915614; 
 Thu, 20 May 2021 06:55:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210314233323.23377-1-chunkuang.hu@kernel.org>
 <20210314233323.23377-2-chunkuang.hu@kernel.org>
 <CAAOTY_8ASVD_kApnRmrrsA6nh3XDYAyS-u0g7jK_GF4KipT=wg@mail.gmail.com>
In-Reply-To: <CAAOTY_8ASVD_kApnRmrrsA6nh3XDYAyS-u0g7jK_GF4KipT=wg@mail.gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Thu, 20 May 2021 08:55:04 -0500
Message-ID: <CABb+yY21AOrZUzoKaFuiqaEyzXn8t4AxjkOM2_G88mxTpX-_Bg@mail.gmail.com>
Subject: Re: [PATCH 1/3] mailbox: mtk-cmdq: Remove cmdq_cb_status
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Houlong Wei <houlong.wei@mediatek.com>, 
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_065517_619761_A69E7660 
X-CRM114-Status: GOOD (  11.80  )
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

T24gV2VkLCBNYXkgMTksIDIwMjEgYXQgNjoyMSBBTSBDaHVuLUt1YW5nIEh1IDxjaHVua3Vhbmcu
aHVAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBIaSwgSmFzc2k6Cj4KPiBDaHVuLUt1YW5nIEh1IDxj
aHVua3VhbmcuaHVAa2VybmVsLm9yZz4g5pa8IDIwMjHlubQz5pyIMTXml6Ug6YCx5LiAIOS4iuWN
iDc6MzPlr6vpgZPvvJoKPiA+Cj4gPiBjbWRxX2NiX3N0YXR1cyBpcyBhbiBlcnJvciBzdGF0dXMu
IFVzZSB0aGUgc3RhbmRhcmQgZXJyb3IgbnVtYmVyCj4gPiBpbnN0ZWFkIG9mIGNtZHFfY2Jfc3Rh
dHVzIHRvIHByZXZlbnQgc3RhdHVzIGR1cGxpY2F0aW9uLgo+Cj4gSG93IGRvIHlvdSB0aGluayBh
Ym91dCB0aGlzIHNlcmllcz8KPgpIbW0sIEkgY2FuJ3QgcmVtZW1iZXIgdGhlIHJlYXNvbiBJIGRp
ZG4ndCBwaWNrLiBCdXQgaXQgd2FzIGRlZmluaXRlbHkKdW5kZXIgInRvZG8iIGxhYmVsLiBJIHdp
bGwgcGljayBpdC4KQlRXLCBpdCBoZWxwcyB0byBzZWUgQWNrZWQtYnkncyBmcm9tIHNvbWVvbmUg
d29ya2luZyBmb3IgdGhlIGgvdyB2ZW5kb3IuCgp0aGFua3MuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QK
TGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
