Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54350C369DC
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Apr 2025 16:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kV54NwFT6iZkwZlyhbM/53RtCc7p3xgDGL6ZU6s+YaI=; b=Oko1j4VWqeoNDIKPirj81yd8hf
	M0MI55mdLqw+FR8b6layB2+amcdd5C/QGdl6joKFZVs0tNdiXA+hNMsS57hWkdZYhjjOlTsF9wVA0
	69XaTiNrPwOLOO1wqYE4LYGh06/3hgM2MlJO287ZNdSMm1XHp9QdWTZqgRyr3SFBfeciSCFOObvvC
	A6yr/qjBKxxL2le+3L3IfiXGLOxQK2NCcCHo/VJJ9wCgZejRix1OGSlBoUmfspCV/xHKZVj6Gidpm
	kgMudm9hcN2/xFTw+ajp/mGFQn4rJabxL/+0OHHmoTcmElIeqviZXYjjRIUgglCBF60f9VoYcNlNM
	qIlVs/AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9nv9-0000000AGoj-3X7T;
	Tue, 29 Apr 2025 16:34:59 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9nq4-0000000AFx0-1R57
	for linux-mediatek@lists.infradead.org;
	Tue, 29 Apr 2025 16:29:45 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-22c33677183so65271765ad.2
        for <linux-mediatek@lists.infradead.org>; Tue, 29 Apr 2025 09:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745944183; x=1746548983; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kV54NwFT6iZkwZlyhbM/53RtCc7p3xgDGL6ZU6s+YaI=;
        b=VLKYR4rDxlWg92bsr9vmtzRaoTVnfe31yppvGV57VWY5/kbeT0S/Ou3vG80ChO/VHl
         31hglfoqlSf2K0uTEq+aQLwVfZ1WfYI6Fpt3b859whVUgmaoUfjOPYrtu4Y/EB8qsm6c
         RpRuwFQ4JCDthfwSTnf/pe/lsE+jGDMjLycDT/XfuDinbTqjUKj4oO2qC4B1UWaCCUV0
         jmIqOORmtCiACaAanDfTg7d8R1GvnwOLx9xhoVUkiSRJw7jbzAOs9sYhvEGCTcIHH00m
         O2N0jeMf1ncan1qd96I5VH2hvX9CtWJzZGe+ZS3moEQVL/3qNaFFMyqMRHgXbWNRNb3V
         Y9BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745944183; x=1746548983;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kV54NwFT6iZkwZlyhbM/53RtCc7p3xgDGL6ZU6s+YaI=;
        b=XWPuAOucCwNr4yvppwr7OXaSWgqNzYuA3NAzdap50FUghDoonQH+QtsFcFrWXrEn+i
         pNDjjL87FEXSFcbiLGbLpa9jNezGBKiPHledKuam1mEs02pjr8Iv9EAcGtSggcNL5lEf
         rOJdUQUjFs4xiH0riw/kSf66hojFi1L0Rzvl0xoSq0TNBBYwYPGwXt6jy8AGdllbQXaW
         XG8+dKjy82Xk7CBemo8tr9kKpY9FYF10QfFuUEslKOymHpRzydl1Q6da3BmaoMjedY6J
         crEhoaFwc1Dq5BTYuiq+vtyN3HbeUjZxWjgVW4+N+rIT3pEJWgfNILMXlEQHpOrbsdcZ
         vlwQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9Pk52hKM/dwqt3lRY3Bmzzhxeiux4CEwWB37SPv9Tc/nrQfFiYajZFaWPV1ZRl24kPvhJNtinDbiLDkvNgg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQBTDvsmTMEskKT83tdOGt1O7nhwjgKZVlSB9TNvsBXKekD2rk
	Ij+l8kLNlQUWTdGUbOS1dll3xIsx3mJ+jBiJwp4Nswql6EnhiyP7xVJJrw==
X-Gm-Gg: ASbGncvnpouzzZb5m+83rYstXQUKs9VkxUYcyzk75wdeiT2r0cyUnDiMd9FangEHZnD
	oshV9VQUl+zGZiowrFLLFyI/d3F95Ro+ngbHhOFJdAHPwFtgWMAncx4HXUVVErmUygHo/F1LY+n
	g0i4F+hhJxw+GP9dTSP+Vm/DUki+kvkhuFJPIhzY7XnfzUxMI6MSGH+DYt3ykn1JUn4TNyKYdVE
	qLWu9v6YunoTAbecPW390CM3yRGMjarEgXx6vRoqVMNtKOQwYaD76TJix+jpB2cVjyaqOFZH0yt
	HGQyHJXVi2FQ+8gCATnOYd8JTM7Ei6KMnUG5JaHPVw==
X-Google-Smtp-Source: AGHT+IH7S2ba85QY5A3S71xSkb4HSg57bgRGtTvcCIed7g4fF8lrRFgDVMh3VVGTcfWTqLUWKDpqOQ==
X-Received: by 2002:a17:903:32c9:b0:223:53fb:e1dd with SMTP id d9443c01a7336-22df3534f10mr200405ad.9.1745944183295;
        Tue, 29 Apr 2025 09:29:43 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:adc2:8397:4f51:d5a0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbd6ebsm104941775ad.80.2025.04.29.09.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 09:29:42 -0700 (PDT)
Date: Tue, 29 Apr 2025 09:29:40 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Gary Bisson <bisson.gary@gmail.com>
Cc: angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, 
	linux-input@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] Input: mtk-pmic-keys - fix possible null pointer
 dereference
Message-ID: <3hpxs4acz4bgef7t3mvdhc2xr6o54vsxthwrpobmaxljo6lryw@lxpeojs5afk2>
References: <20250429122815.72724-1-bisson.gary@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429122815.72724-1-bisson.gary@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_092944_378333_55ADBE44 
X-CRM114-Status: GOOD (  13.80  )
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

On Tue, Apr 29, 2025 at 02:28:15PM +0200, Gary Bisson wrote:
> In mtk_pmic_keys_probe, the regs parameter is only set if the button is
> parsed in the device tree. However, on hardware where the button is left
> floating, that node will most likely be removed not to enable that
> input. In that case the code will try to dereference a null pointer.
> 
> Let's use the regs struct instead as it is defined for all supported
> platforms. Note that it is ok setting the key reg even if that latter is
> disabled as the interrupt won't be enabled anyway.
> 
> Fixes: b581acb49aec5 ("Input: mtk-pmic-keys - transfer per-key bit in
> mtk_pmic_keys_regs")
> 
> Signed-off-by: Gary Bisson <bisson.gary@gmail.com>

Applied, thank you.

-- 
Dmitry

