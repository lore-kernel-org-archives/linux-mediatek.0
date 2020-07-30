Return-Path: <SRS0=dQnm=BJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B70BCC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 09:04:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 847122072A
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 09:04:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KDlArTab";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Js2quz4J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 847122072A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7zEHfv/8iYvz4p1Nzqk3reUfD8326ftxAvmkTrS7VgA=; b=KDlArTabs/4Sp7mL5y8k7NFMh
	msy1uGhIhvxGCSaMmydGGufck9H/D5jZlx7vGTbsdmvsMkvlQOBWZ7geF02e28Vz+U/IxcOWZnjaJ
	cSfoIobEXx3kocBlxpeXTiYcXJyzqbFolHCyxd38QJe3EDN/CmA3wGHN580giIPkd+r45rl3O2LKE
	GVRcCst0YVD01FtvI5EYptX1wv5lXc/iPwEAJO6dOyjUvK0+gzn5uMYJEXP4d+TxQZkL0asjX8vey
	qnz1z3k0Fx7DSJRhyMeLixxLVjeBAZglGIHZ/b8TLVg75qI3oUkvTg/jDv42rZtBrWdQ7o0oK9Cas
	3p1N3FEaw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k14UK-0001oD-RI; Thu, 30 Jul 2020 09:04:32 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k14UC-0001lu-HL; Thu, 30 Jul 2020 09:04:25 +0000
Received: by mail-wr1-x432.google.com with SMTP id z18so20582751wrm.12;
 Thu, 30 Jul 2020 02:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aKPCuC6cV43Gz6CZUTrsJDoMfLLgLsLNYcX4uUjXR/s=;
 b=Js2quz4Jzwla5NQlEGwmNRMBAtglE93LczVztFTcGQCzuwX++Gfwu6qOBu/i2U+u+6
 JlXo/o7WF57lbHeh7LgYSFQz9CRKXjyu6CuAaQ1kXqmffVrkK0a02QifXPQNZRwsAwoE
 QspVIBfwY9bk5C/OfEQAm877moMYZP7ulj5LmKUdAjurGRF7FQzLCBHzqyUjb6U9760F
 IM1rbC8VsnKd1EcRrqP/4ozGInw5dPl+md2WOpsotHAtPpcDw4syDggYRHEunPtsxDCB
 B8kYMf88n/oCLtkGaNLh2lyPgBUcZC/LBDg1AHNLhn+tLzipWL8oExLxVNhw1tR6yQf1
 UqNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aKPCuC6cV43Gz6CZUTrsJDoMfLLgLsLNYcX4uUjXR/s=;
 b=t2i14YSG5dlOocf9fu770TfoJTVxMROpS+MfUmD6zksSIsWmy6cKU4SEdubXnH36uz
 FLPus2SID8krtBNP1jt97xxpRO0d3t8+1x9HG+Frm0FMTTpwle+LQ5SffUfOK4ohXRVF
 zXTnvO+Sp3BYDxk2Gr/K9L6zD81CwHhMHUTo51qbxq0cemU09N3S1UHmsl9uj2KVNOrj
 jxukc09iy6SjvkRrTJWjuGEijcKqDY5U1wtcivxIdKvgmsu2oeFtU+mrAEzUjFeHRBIk
 DSAv1csu9t+f1rvkDGA75NcWmsoNOySS76jiGkj3kN+0KWjAbAcpPzHYdtSE0QmOB2tU
 vEQQ==
X-Gm-Message-State: AOAM530Iz1HgTe/ULJFzqQIhP4VgybCy+o9XBd8j5QGRuEPVBZOUqm85
 QnLj+m6eKW0CPGlZA9XxDMUKXChQ3Bo=
X-Google-Smtp-Source: ABdhPJykxd8v58iQt7sdbe0FAorvbijjBBCDtdJ70BfJ8hS/Iw/2ISlMlMjYNfdai4y4V3BOKPeO6w==
X-Received: by 2002:a5d:4d87:: with SMTP id b7mr1970811wru.170.1596099863016; 
 Thu, 30 Jul 2020 02:04:23 -0700 (PDT)
Received: from ziggy.stardust (81.172.57.81.dyn.user.ono.com. [81.172.57.81])
 by smtp.gmail.com with ESMTPSA id
 o126sm9515635wma.20.2020.07.30.02.04.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2020 02:04:22 -0700 (PDT)
Subject: Re: [v2,2/3] dt-binding: mt8192: add toprgu reset-controller head file
To: Crystal Guo <crystal.guo@mediatek.com>, linux@roeck-us.net,
 robh+dt@kernel.org
References: <1596016922-13184-1-git-send-email-crystal.guo@mediatek.com>
 <1596016922-13184-3-git-send-email-crystal.guo@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <7afab63f-8cba-3043-576b-a41f3bdda3ac@gmail.com>
Date: Thu, 30 Jul 2020 11:04:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1596016922-13184-3-git-send-email-crystal.guo@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_050424_667327_3398C3FB 
X-CRM114-Status: GOOD (  18.56  )
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
Cc: linux-watchdog@vger.kernel.org, srv_heupstream@mediatek.com,
 seiya.wang@mediatek.com, erin.lo@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 29/07/2020 12:02, Crystal Guo wrote:
> add toprgu reset-controller head file for MT8192 platform
> 
> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   .../dt-bindings/reset-controller/mt8192-resets.h   | 30 ++++++++++++++++++++++
>   1 file changed, 30 insertions(+)
>   create mode 100644 include/dt-bindings/reset-controller/mt8192-resets.h
> 
> diff --git a/include/dt-bindings/reset-controller/mt8192-resets.h b/include/dt-bindings/reset-controller/mt8192-resets.h
> new file mode 100644
> index 0000000..be9a7ca
> --- /dev/null
> +++ b/include/dt-bindings/reset-controller/mt8192-resets.h
> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2020 MediaTek Inc.
> + * Author: Yong Liang <yong.liang@mediatek.com>
> + */
> +
> +#ifndef _DT_BINDINGS_RESET_CONTROLLER_MT8192
> +#define _DT_BINDINGS_RESET_CONTROLLER_MT8192
> +
> +#define MT8192_TOPRGU_MM_SW_RST					1
> +#define MT8192_TOPRGU_MFG_SW_RST				2
> +#define MT8192_TOPRGU_VENC_SW_RST				3
> +#define MT8192_TOPRGU_VDEC_SW_RST				4
> +#define MT8192_TOPRGU_IMG_SW_RST				5
> +#define MT8192_TOPRGU_MD_SW_RST					7
> +#define MT8192_TOPRGU_CONN_SW_RST				9
> +#define MT8192_TOPRGU_CONN_MCU_SW_RST			12
> +#define MT8192_TOPRGU_IPU0_SW_RST				14
> +#define MT8192_TOPRGU_IPU1_SW_RST				15
> +#define MT8192_TOPRGU_AUDIO_SW_RST				17
> +#define MT8192_TOPRGU_CAMSYS_SW_RST				18
> +#define MT8192_TOPRGU_MJC_SW_RST				19
> +#define MT8192_TOPRGU_C2K_S2_SW_RST				20
> +#define MT8192_TOPRGU_C2K_SW_RST				21
> +#define MT8192_TOPRGU_PERI_SW_RST				22
> +#define MT8192_TOPRGU_PERI_AO_SW_RST			23
> +
> +#define MT8192_TOPRGU_SW_RST_NUM				23
> +
> +#endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8192 */
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
