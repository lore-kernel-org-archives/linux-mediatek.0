Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7759D1CDA1
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Oct 2024 06:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QxgWfYk6RsfNKEy9+LQHYE8HYCPmjjlwPvsciN/vF+c=; b=EFUyFc+7xbXHRK2Wne6l8+F/0z
	NbAYv+KSVkbl/8LwQV+o5JOWitQMooDF7aUyrHcX0oLdUQ0dlsrR61uSk95CDQIkKuXVbrZUuhPUu
	FeCFN/UWLXHcGIcmqei/iZftHjxMjiCGyeMWGu0PNDu8gjgFPZh3gm/un02HDG/r9LBDBePjM9VCQ
	pQXD/nfX93s8Cc651u3zHHTktEgH/rKQHWQfbKjoAO5KD1KvHDk1aCfWzBYy6b2LYWrdxdvJ6BIEY
	iJZxlcOJ5joqi47RjYFDKmz2G8LU7336816KT+TkEQBC6ZQ8VBMpT1jNxKF5lDQB/ks8QZ78rgLsM
	2CVfz8Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t38ex-00000009rnr-1yZW;
	Tue, 22 Oct 2024 06:46:27 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t38dF-00000009rLn-3sNH;
	Tue, 22 Oct 2024 06:44:45 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-71ea2643545so3338002b3a.3;
        Mon, 21 Oct 2024 23:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729579480; x=1730184280; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QxgWfYk6RsfNKEy9+LQHYE8HYCPmjjlwPvsciN/vF+c=;
        b=jQULHMsc0zKb8IZIQGJJhEHKDfhACfD+wrzCiyZ1yxC7cIA/Sa5l29f8Jhy+It6twP
         jtYj4jiBJRFCvKqE/yuFDvmnt2oMpmZEcTAFKtMSD4bWgqiTkbmfklwrxiKOXltsUuhm
         kRnjO92DspXe9I5oh4SxPvlXB2UBZxHvcPkynFycx3af/dTgSgF0xknNYUiqScRSBtLE
         MAZloHqFzyyUyL809jUOWah5td2cxKapMBuEnQAZsR5wmSP9YiWOd51kJxBxswGwatoJ
         ZkSrMzEOUElN0uYoJ+pcsLUDluRxqzSQQLK9GFRAN0SgICN8kaNmI38qXJDzfPXzmVCa
         Hc5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729579480; x=1730184280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QxgWfYk6RsfNKEy9+LQHYE8HYCPmjjlwPvsciN/vF+c=;
        b=Cm0uuTTAV/Pg/r3jtBKv8UrHkQXdDaZRozcemKcyyMcVV630kTcH9HV7ylclHPTX1E
         UgGMObefwbert7fgYN9W9XvSFaxtHfgu8QL15xSSFxTnq7AP9kb/nOcQ8ughdef6LJWg
         1HtBuqWkahuDjL3IXBx5xl2JLeQf/aiQRuYQzYhxeTrxJhO8MYyrAULiqTjWwynF5SEr
         aGriRr0Z+BW7UayGk151UZF1GovT83MQjFdGsM/2/OQ6vgW6bi/QpZb/PNdzPh1ZOv+B
         HTcDw6Ig1p2kCnh3oJeXSm6j4X3ayakrw7TjYUc33k5oLfRZ10euxIz89i/Zo8CS9LDG
         EhsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvIrUBHY2MuIA1Iz7zRDGDJhhq6ldk4iNOO0cxx2qvSiYJ6/q6N/LqXpG8oCLvMiE5UagvVPDjTUGg2rT/PQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzpX3Ze1T7uR3+n6SDK7vLm5qfnpb7QfbXB9X4fROMqT/K8sxB4
	dBI3lKfJcWJ/ToVlBMA6K88pfqW1A1HEi86dHJPJYbujpIF07SOI
X-Google-Smtp-Source: AGHT+IGhP8r3CFpAF+d15f/9wkzHjVCJEatiKTQRq2iuUCFW738yTKt/tIhDtbjY18NKeBn0uYaajA==
X-Received: by 2002:a05:6a00:2302:b0:71e:5a1d:ecdc with SMTP id d2e1a72fcca58-71ea31d2c22mr20110650b3a.17.1729579480136;
        Mon, 21 Oct 2024 23:44:40 -0700 (PDT)
Received: from archlinux.. ([2405:201:e00c:517f:5e87:9cff:fe63:6000])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71ec1312d1fsm3988625b3a.5.2024.10.21.23.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 23:44:39 -0700 (PDT)
From: Mohammed Anees <pvmohammedanees2003@gmail.com>
To: angelogioacchino.delregno@collabora.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com,
	mchehab@kernel.org,
	moudy.ho@mediatek.com,
	pvmohammedanees2003@gmail.com,
	ribalda@chromium.org,
	sebastian.fricke@collabora.com
Subject: Re: [PATCH] media: platform: mtk-mdp3: cmdq: Remove duplicated platforms checks 
Date: Tue, 22 Oct 2024 12:12:40 +0530
Message-ID: <20241022064250.143591-1-pvmohammedanees2003@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <427feed3-f51b-40d1-8609-4534a2815fc1@collabora.com>
References: <427feed3-f51b-40d1-8609-4534a2815fc1@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_234442_119455_563B2229 
X-CRM114-Status: GOOD (  11.36  )
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

> This should've been [PATCH v2], because this *is* a version 2: even if you
> have changed the title a bit, it's still "the same" patch ;-)

Oh okay!! I didn’t know that one should have marked it as v2. My apologies 
for that! Thanks for being lenient this time, I really appreciate it. 
I’ll make sure this doesn’t happen again.

> Next time, please version your patches correctly.
Absolutely!
>
> Anyway, apart from this not being declared as v2, this time I'll let you
> get my
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>
> ...because the patch is good, and because it's only the first time that I warn
> you about this :-)
>
>Keep up the good work!

Thanks!

