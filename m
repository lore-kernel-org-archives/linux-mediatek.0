Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33BCBCF6493
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Sep 2024 17:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p8NuiYSt8wJAr0VVOHDlVqwMqiURWjiBsLWVHXGngnA=; b=amslpzL6U7+MwRZ5Q2qiONMhTo
	NoLfgnUJZUkDgO62YgapnC0XSFmxB3r7vnZeIDYGrGXCtMSDIA/PmMr/TLA905imD+TGd063fA1ey
	YSA7Ekd1+5gcuv/I4OMrMtbqCb1kluRBeWHwl0SwNshKZprjXMTTa9bLT9gGLBp9Ri2bTsdzzk53P
	zpsMtZfspznVHVL7SbfCSLt2kqWOstNPcXHqJ7gex3+NQOCheOZdSBI7xlkmwtlnJK/QVeBiWlfIB
	4/tFkVxgtwbGKLi02L48yWX/YRWOpkwzJ7N9KUHyPaROXgVZ8NvYxa3QHMZ+a/aVr0rik8k9d1s6O
	bDFmoAOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sub5v-0000000DOsn-2L1d;
	Sat, 28 Sep 2024 17:18:59 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sub5t-0000000DOsN-0Ogk;
	Sat, 28 Sep 2024 17:18:58 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-42cafda818aso29518385e9.2;
        Sat, 28 Sep 2024 10:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727543935; x=1728148735; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p8NuiYSt8wJAr0VVOHDlVqwMqiURWjiBsLWVHXGngnA=;
        b=W9xILtkMIg4+kY70G8PMOik+HNi8q/DiAFYoj+TDBxlW+PkCdcPFpczNiLZtoKtWlj
         scTzPVDqfhjs+PLNjAcnpdyQzsokDU93Ito2tsi4t6TMRmHoKuPiN/0nlfRyrIC+YfZL
         sB8gJe6n73qZR0D3JS1T6F/KdWIveB5bSjc6bHqCBl7mA9nZGVbPZY3ejq1ZFrJs62MQ
         G9OxNRXTTGXB35rr/hQyR67qkWff2oIK0xdjk61hVVdcDoMkK0UFZfcS5lViOXbKb+p6
         ngAfk9zkiKxRBsq/JlPscwcXwb1DlQe7fD8kjB7KMWSXh6Z+/avztfu1KxIaVy8U0vJ7
         udrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727543935; x=1728148735;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p8NuiYSt8wJAr0VVOHDlVqwMqiURWjiBsLWVHXGngnA=;
        b=cna9eV+CEWwbHZQknU4LiM8gqOWW5eKxnzpAm+vzKf+ocIbkXQ+/BBYFfXVdn4C3iu
         BNV0Fu5D7xKteqQz9kMmMcwERCvgHXFd1Z/AQOm75ds1TZFV9bEz2gu672IvXGsfcYgs
         sOpATgRu4+Fvh+DAtgmBDt6m6GMG1RbjssbmZE4N4MugP6TrI72lyqt3UQTEeSggLVw5
         hL3bhrALxJdzdQx4lJZqXeN2BeXMxsZoDxGzeHszzdZi7hE7jnbT6nVP/o4qRo5TUf/H
         3pPk1T7+H6YrpqfH+dDTrFHqnvqvd/J4x3aaLW3ppH7/Zzr9tV8tAsFHaM5TMweW/WMh
         YfYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUv1cwe6o7q10F+07UX4d3Ps3zXniZkfAr+5U+tycYDQ8IaaX9/YSxdvR7nq05CLpWtRlNZz9v5afXChIN37XQe@lists.infradead.org, AJvYcCWkSTQ4jxHE9SUXr9y8jm6a583z0gAm56PG+KPE3QE1XQiTrHrweTLVKdLdwpJUW/l4MTVKni1e1qy+xPO+AKU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzS4sG6a/PTat/IGCJx/wVdHdzEqggB/rcqyL7OlBHQs/A9afuz
	0hTjgtn2X37yb89EcxKe8ZRn1XJjINQUo47u3o8rlC4kbUVL8Fp7
X-Google-Smtp-Source: AGHT+IFmmIHk7jMGC1Rr49hdZC3xWIHG0TdbmxVJ/tvIZRVpiLLGzZ/mp8cIHr9g4anhuMyAjTK08g==
X-Received: by 2002:a05:6000:d8f:b0:37c:ced2:843b with SMTP id ffacd0b85a97d-37cd5ab75fcmr5003739f8f.20.1727543935169;
        Sat, 28 Sep 2024 10:18:55 -0700 (PDT)
Received: from [192.168.0.10] ([178.233.24.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd5730e92sm5262538f8f.80.2024.09.28.10.18.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Sep 2024 10:18:54 -0700 (PDT)
Message-ID: <5207019e-5059-4721-8ac6-4f4ea2753643@gmail.com>
Date: Sat, 28 Sep 2024 20:18:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/3] Fix degradation problem of alpha blending series
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Singo Chang
 <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>
References: <20240928161546.9285-1-jason-jh.lin@mediatek.com>
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
Content-Language: en-US, tr, en-GB
In-Reply-To: <20240928161546.9285-1-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240928_101857_170678_EA6DB53A 
X-CRM114-Status: GOOD (  10.55  )
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

Hi,

On 2024-09-28 19:15 +03:00, Jason-JH.Lin wrote:
> From: Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>
> 
> Some SoCs not support pre-multiplied pixel formats and extending
> configuration of OVL pre-multiplied color formats, such as MT8173.
> 
> Fix the SoC degradation problem by this sreies.
> 
> ---
> Change in v8:
> Remove blend_modes for not supported pre-multiplied SoCs to fix the
> return error from drm_plane_create_blend_mode_property().
> 
> [...]

I no longer see the warnings I mentioned in v7, and everything looks OK
on my MT8173, MT8183, MT8186 Chromebooks.

Tested-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>

