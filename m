Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 515A61088E6F
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2026 09:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UjWzodMHHiPQ8qpM8gCAfjVpQOUkrpvH4qFscxhdfJE=; b=OyQy785mprNNoIo5JD8QaHi3rF
	6DI/CVdnTBBAE/tkI+UeXmq5fel0BNZy5hnUeY79sH/WrvpL0yy7XfGdfQdmC2OLTP5j6oFs2mSW3
	d740GjirO08jzxxwx6V7EoHgqLyJ3b6FTITsGsZhPXlkq/+1gAkui4mhWvqq2L9agOBxqqKZXVfKs
	wX3Iwjlm+k/ev7sLYJu/48LOA24ifLcxKDp24clYri3sDjB8V/WVRIyvSURkzUcLPVxRHqhDLKnxt
	WS0YqJXTvb3mAz0odznp5wnH+7gxvwfy+la7KrfFHlWiesTcn1JyRZZmR7o44Cpgx8lL2+tom8xok
	GSq/64CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3W6z-0000000CTOy-1rz1;
	Fri, 20 Mar 2026 09:25:45 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3W6x-0000000CTNH-0IOW
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Mar 2026 09:25:44 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-79a5ad7cc52so19501027b3.2
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Mar 2026 02:25:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773998741; cv=none;
        d=google.com; s=arc-20240605;
        b=Rlpu4lKw0oJQVdUpAsqYkWRDsIFeD4ufSCaLN+fTLlrURGpbmrxvHYLaL2VxKttqb6
         lwDZBfd8+MeDWDcr51htODVVamm/N+AbTn+iD6hJ94RIBJ0i4ADexK4OtUmvW0H6AXpB
         iTBahD8UCd7ARx/Fc9TaGcXEtxSn+ZqlHrhCpITbRxRl8bb3y0t55B/H6HrffNFa1kkq
         Fe/Cy/K+nVs6bswrp7m/9wUXPNKq5v13n/fN6u5YFWePluSLVVprSCuPYFrXrx/QbA+N
         WIurrOZoAT7Nl6rkkS19c/NZ2fxhoIPfOU/PwXxCnKHw+fBng+GFbRj/uyHg36B+dP6F
         T+kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UjWzodMHHiPQ8qpM8gCAfjVpQOUkrpvH4qFscxhdfJE=;
        fh=K+jmWNCAmAcI4iAezTXcShlNKX9OtKJ94+5iHB5qb7g=;
        b=ICLPmNwkNBK5+6DK3P+DUuJQx6rDm4IGMF3GlGOI5Hy7aqHTMh1NKxZuXHPXdE0czI
         Lyt9Iws1Mp+lky1hvQc726Ubj4lOZ0WiuKVPhsGYKVPdWa8+wSHQYTsMTZ3AVhzOBGax
         KABjj4GN+/t1k0vfjYXBBpo04nKcAU/oNgCoP5Kh5PZB30tcsq99nkkLMzRi/6+mlX2k
         dki0UIFGNfYZKiGoARTs5e+fKmieyvtjWD7ZP0y1VlKX2T2nUNKW9E229n7EcDNrEm9L
         EBO6d4jf8G44HfODtqS7MDpLp+5Yw830kIm14sN5DSWrXrW0rYKgddfFj0PxG0+d8+3g
         TnOQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773998741; x=1774603541; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UjWzodMHHiPQ8qpM8gCAfjVpQOUkrpvH4qFscxhdfJE=;
        b=JBugrMbg+mDygVZAXskJeFXIfiSHNemlYLdLf4cpjPZJxT3Tz6kiRXToDGTdl+jTkv
         dhN1ZnrwsYBJOXfbOlaRYU0aYua98jJcrw67GIPIabWO3LBUbNVqxvip9EKBlP/0RtPH
         86D38LABLTbDBxjzZbO3WvG7ZT7wTUyrh/O0BM8J/yjJuJcfp2CNyOXL7FnWq0EsAUUC
         EYCMVrTn1J5Pl+9Ve2MYM9bW/wghAdesgMKLT4D2oo6ps9NBxn3fPEHwkNgH8fODewnU
         LFwmFTNzqNWr+TFNWLtQ7XHEF40VF+KGXJqz89nZ6i8WqgqFwj2wmAvyh8fYLHet3TaM
         HQxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773998741; x=1774603541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UjWzodMHHiPQ8qpM8gCAfjVpQOUkrpvH4qFscxhdfJE=;
        b=GacaVRlEWY9sOpfIVNv1+y7uqlbRM1nuHZZn7z7Lzy9MwY54fYcO9+fRmQsXYPo2iz
         56MB3BIc4eVNf3yLKCq0Xtg09ZJv5QVvuF6jrB3eo7qU5Sj39YpOc4LAbcPFBzfIkoxy
         H8Aj0Ld9u3JPr2cEdyNfG16WSkbJ3qDS9ucJXdmmmTjgfcnTYxvh0Q1gJ6/9ThUiGomX
         0unKqy8l4NAbdU6wKSCnGdryGbuSjMy5dTVWEFePdc0n7gVyaOh9yj3+fPUmuCVlWrtg
         9OKfBtCi5mllNunIEEeTH2c6IO9LpARla811vUkX57zDBPfQpo2g9CFD4ePhqQq1qrBi
         dBNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeWSnCiV60gAKhRTGTVYe3JClXU9jDnbaQOdyKXcC/+ZZffFp5/FZo/TYrcXi/2R8flY3+UkEYRlx5+GdAYA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9z2wlSLJm7gIhiKV4yPIfMx+aBfnnNftiCLoYy/qpCLpNFLCT
	4dr3RPhVib5IzIfAerRCs4+kHvNkI1V+nblcN4BvUpFPujrV1YO9ay+7MwIBBbh7gxYifRliykV
	CQsP5I1gsqRfGQMFG1asM5kloa912Tpw9st7S7ymfOQ==
X-Gm-Gg: ATEYQzwDg/j+/tEsOJcxGdykeCXzVCKEnqi+L01XwSh4JdAT9V5giFXbYyeQ2VdOY5/
	NlDxYjcY5NNnbl68wqyPUsyHP9xEQ8ip64cvQfynWQRBtHe6yDXq5j1aRD3HSfV+MDQG+FxK0tk
	cFVj8L/XmqUeYSIkD8fEZLYrAGlViQt5u3MxOhd01DSvFdFkxhCka4x3Iy/EDob6QPo4z9s+7bQ
	bNyB6aTcK+FwVj/66sz/BRsyWU80CtGWWdtrAPErxKPfajBolSopN15s+aJsOsCP2QR8uDk3gEQ
	rrucF7Dkz4N/whWa
X-Received: by 2002:a05:690c:3181:b0:798:7498:4ae4 with SMTP id
 00721157ae682-79a90c21cd0mr21006217b3.53.1773998741596; Fri, 20 Mar 2026
 02:25:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260319032649.337812-1-dqfext@gmail.com> <20260320091910.GA2048760@horms.kernel.org>
In-Reply-To: <20260320091910.GA2048760@horms.kernel.org>
From: Qingfang Deng <dqfext@gmail.com>
Date: Fri, 20 Mar 2026 17:25:29 +0800
X-Gm-Features: AaiRm51UgkKJTce5m7yOHpFLNBuXksPYXf9B03a4b3Hvrvl-JqUwcOrWd9BIh_4
Message-ID: <CALW65jb_4WjSGZyp7ruX1b=DvpkL6HyeNfvAyuBzNYizQaHJdg@mail.gmail.com>
Subject: Re: [PATCH net] net: airoha: add RCU lock around dev_fill_forward_path
To: Simon Horman <horms@kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Pablo Neira Ayuso <pablo@netfilter.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_022543_114916_082183E6 
X-CRM114-Status: UNSURE (   9.51  )
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

On Fri, Mar 20, 2026 at 5:19=E2=80=AFPM Simon Horman <horms@kernel.org> wro=
te:
> I understand from the patch description that the problem didn't manifest
> until this merge commit. But nonetheless I don't think using
> a merge commit in the Fixes tag is the best approach. For one thing,
> it seems somewhat difficult to use effectively to guide backporting.
>
> I would suggest using the flowtable commit as the fixes tag:
>
> Fixes: a8bdd935d1dd ("net: airoha: Add wlan flowtable TX offload")
>
> Or perhaps fixes tags for both a8bdd935d1dd and 0417adf367a0.
>
> Flagged by AI generated code review, which also suggested citing a8bdd935=
d1dd.

Okay, I'll update the tag in v2.

