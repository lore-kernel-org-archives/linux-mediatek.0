Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2715CCF2D2
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jan 2026 10:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kjW2cdDM+NTx8Y+zHvjqMRHQapz9fGB+/aetJ7+p/UE=; b=nXu5XUDHiaC/B05DQZLMMISY7J
	X9EoOs/6bjkbpRbIyATVRnSWbOF3CxLSTwLOuzM3eNkdcg+eufuHjK9qeb3PUqFMzEIpEnb3Rr3ed
	6ngScWy4Ho5bsiLAA8o8DCV0aN7O0IeUZR4ShD/RlEn/KS99eIwDKxUMwos+ZX5/1ZRv40E88HelI
	SWd3F2/dBWE4P3tVzL1yuvotfS5baA1LRf2pMUjNFsjC3TC02IwsZSC1OyNI6n4fYCetomcWfKtxt
	dLvtRPG8ynCId4A8H3lctBeF+BjEMYDo82Zqh/WAl+T1J0WXTAFSrsmqiHPfMuf85Xsa98HMw4rZz
	cKVGDD8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmIy-00000001jpo-0AAI;
	Mon, 19 Jan 2026 10:16:16 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmIu-00000001joI-3tUM
	for linux-mediatek@lists.infradead.org;
	Mon, 19 Jan 2026 10:16:14 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-12460a7caa2so824523c88.1
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Jan 2026 02:16:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768817772; cv=none;
        d=google.com; s=arc-20240605;
        b=kpyrxQcp5NrfXtg3J/nKdHWWH61i/zDCMk9ineaGu97uDHJAZ7lTkQGSJ0iH0pCPy/
         784P/ZlYVN0zN4h+oR8Dq7NYM1oVAeWOXt1y9IZ07pFMx62LlDcDhtbM6c1qLb2hZDN4
         SNbdFT4h8PYqtlvO4j6hIviqmyPPolcXKJIbAIqYvg+TnWFw9FVMfCPkd1XGoqj6DnsW
         +3wQp2CGkWnNwWIqixEODencrSOlv5tPaKdV4y16r06oggGWGHYFkBILjGLDhmlv9Y8p
         8QXOk5dQtT7nTbmd0Hg1ymqNF1hjXXzO1GWIssBPGa/Fr4JyYtK/16kziNbVrSUlVS2G
         CCXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kjW2cdDM+NTx8Y+zHvjqMRHQapz9fGB+/aetJ7+p/UE=;
        fh=KqSTzZkOUJPh/12CG6e4kV9U+HvoW2batVyjjHY7nK8=;
        b=jk1q8D4C58dJ4GpyVoGMIO28ZvYkwDiGwtdW/hAVhccYgz8+ffq7czyqIwYLKL2ShZ
         aR2tIRHMA1cXRrPNGbkifsWQscOjRxXeQnlceFtTGHLy/7ND4UA7x5a6j7+bsrmvHU6a
         RaIUGvBtA1a4SlBfXzpHJ3E07mWfp4Cx6Jq1AdzzUZVhkBlpIqE3FK0msPUxxsdJqA8t
         +JfqLSMVGd7TLgi7b9nGt1HXX2DUJVIM/uuKc+icVwN4S7LAb4HpAEqdgpgI43iLpLTp
         A4KP/mgQmMYQ1AgCHgOggoWT8C2SN0p57sA8kA9CAo++Qcinvjx5TOct7vthplpxEyOR
         gWUw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768817772; x=1769422572; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kjW2cdDM+NTx8Y+zHvjqMRHQapz9fGB+/aetJ7+p/UE=;
        b=a3SP4x2xDQ/b+mYcF1RusB2EEqQgClfp49qIFZF+j0ZjyFJafabxetAKwWlIxmBpsK
         ysWRaFol8vrbVi/k8r312KfeTUQ5p/bsddROqv1Rk6KhuklSciOoKxB4tfbKESbof1DS
         FjFRy7pc9W3hg4zeB916tuQMgAUQSEIlL3uuNtCJf8duXoEGI3m5NKVXjseCZRLRjn/O
         OWnFkxDeLFhNFgK454pV/RzG+uq/J2zoVcZlUmUgMPEub4Atkh+wV0SQgSX26SXxfTDy
         QizgRbLTSYl4dv4sREWqs8T9ESDUIkV/R7rxxwxOTazSfKXZBROLTr7e2Y5M6H+iCUNL
         24KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768817772; x=1769422572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kjW2cdDM+NTx8Y+zHvjqMRHQapz9fGB+/aetJ7+p/UE=;
        b=oo0rOs4SLZIlgqPn43R011E4wlDSF1D3bcfj4huGfAEn1soiKgwWuHtY8ygUQKgmdL
         7UMjrCKzuIHKlFhUtJGJ0aKSFeWJ/3+xFQeDfNjVnnmjg+msHwvuFfmb4H4jg2X24m5K
         F5hVUuhsIbmmLcS8Va2bhiqm3f09xF5BYzNFQUNJtLwLpUcqLfCdFjbVb/kqjVSWN3Y+
         1PigDzvIIP+Ll3XYmnRmpgLtjAhUbZSDNoZLj1obOjlfOBlhE+WsEikKnobNeVf2YWWe
         hS6M+3Sk4qiwCJaYS/tySEKwLxzR/U1ggGWcr9MbVekDEibuFPVcW+HlNiNjJtH+Mutv
         D7Gg==
X-Forwarded-Encrypted: i=1; AJvYcCUZ9WMGpVwlTGXuxsMbK6x5xF+k4oIXBjTI91uPtWF2+ByGyYylqP4a+iUSpmvsJoBGf/ViHxNzsQOC3dlnCg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwPIJ6xy3cUHnbmlUx1LoJL47gKG8T2qUF2+dcwI6slMmhRmOkv
	fnXLArY4N0ECm8KG7//yUfhZyUlsVLA6gZmXGyB0pa39kGtUiPNApGLWaOPEvwiBS1NET96X0ka
	vY8DLQq31Y5bZveV4k8caf4fdnuQ79uQ=
X-Gm-Gg: AY/fxX6ViRFgJ9KS8qXw++9cbB+vQlXEce5aErjL5YEc+JLyXVaETMngKSOsopNZG6J
	ssJV/LbA8iYP5j4kPF2oC2NsWwfFRwWJJTZ5ejhbn/qf0nWYmB+EFQID45M++d33UUvDz+xaW2s
	LsY6QwR4skyFCaljolBasaD6J876NW/KNoM9irBvcO5SAzyMCHCXZisle6e6tjCL6it/3Di9c7I
	eUrLwG+FGDkw05BSBNKVSsISvGDsr8tsgSSure62lKvwSnyDjr6I5wTr7uGISY3JJ03SbjLCLSN
	qI4xRg4rysuuaPysR5ubTHqDTDNWCxUk1VQTWnhwva6RkMCWXO/fk8RRt59Umk1qjLvx/NmPFGN
	n4Y5OYXPhzw==
X-Received: by 2002:a05:7022:4186:b0:119:e569:f610 with SMTP id
 a92af1059eb24-1244b3050aamr8034972c88.9.1768817772025; Mon, 19 Jan 2026
 02:16:12 -0800 (PST)
MIME-Version: 1.0
References: <20260119095511.3030739-1-zhipeng.wang_1@nxp.com> <20260119095511.3030739-3-zhipeng.wang_1@nxp.com>
In-Reply-To: <20260119095511.3030739-3-zhipeng.wang_1@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 19 Jan 2026 12:18:51 +0200
X-Gm-Features: AZwV_QixVtScRtb2C4OPOYIUU0C3OQvhdNUPWS99N4NE6jCxi1_9ifc9b22NkVs
Message-ID: <CAEnQRZCm+r3TgvnwsYTbiC6K4ODGK=rCCsi-LxXq=EMtMAndaA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] clocksource/drivers/timer-of: Remove __init markings
To: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Cc: daniel.lezcano@linaro.org, tglx@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	chun-hung.wu@mediatek.com, walter.chang@mediatek.com, jstultz@google.com, 
	amergnat@baylibre.com, aisheng.dong@nxp.com, jindong.yue@nxp.com, 
	xuegang.liu@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_021612_962031_C2BE2118 
X-CRM114-Status: UNSURE (   7.93  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jan 19, 2026 at 12:00=E2=80=AFPM Zhipeng Wang <zhipeng.wang_1@nxp.c=
om> wrote:
>
> From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
>
> Remove __init markings to allow timer drivers
> can be compiled as modules.
>
> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> Signed-off-by: Walter Chang <walter.chang@mediatek.com>
> Acked-by: John Stultz <jstultz@google.com>
> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

