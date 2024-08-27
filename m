Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84079C54731
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Aug 2024 15:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k7V95t9Eny7FjX1177LVW9tNDMS6rw8HF+Z0knd4Kuc=; b=liapG/8Z5Frwt7Vigs1f8zRyYj
	PcodGeQQOER8+rDitu1lTm+emik2D+1LHenr7FqH/GSkPYUWJXUQLaF3NYfA1Y11h3336dgm6z+09
	6jgv3nhR2Zu+93rFaqiXYYlI1PRNQJu0Nkh5V1Y1WN1RJ/FwftSZdtbqEnsM30LPsty3oTOfLkdy6
	FPIadvld4/u+DVjbcvHIw+zH0i2YJA9bRjC1eDsGIruIYze1nwrw8fJcq72yCOfdlF8sKX1Cjx0wj
	7eHrN/rkDPF54OIl0mSONPXpzLICz5aEx8bXSEq6d5x0BSVyjMoenjHuMul8LKs0MY1OEDv9jockt
	f2JCVyAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siyEm-0000000BuSm-0DB3;
	Tue, 27 Aug 2024 15:36:04 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siy6p-0000000BsL2-2C6L;
	Tue, 27 Aug 2024 15:27:52 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-201df0b2df4so46002335ad.0;
        Tue, 27 Aug 2024 08:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724772470; x=1725377270; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k7V95t9Eny7FjX1177LVW9tNDMS6rw8HF+Z0knd4Kuc=;
        b=ZjWH2o3ZwEnOKxEsiOXqxmHPqvnOjI+kizqT+27q9ViR80BxlVsH2J5DdgVgAjBO1c
         mA/Ei53rdAGUWoKojhwApYCc+bwel3oM8PbwuMUQJ7k7HTHreWltPnQjgGddDg19LPc0
         Uz0Jqd5LXee1Vt9kJFnKJ2ECp5+z25zeKRvz7z8fhgaEA+6LrqJ41vNtiYljzf+rLUm3
         sM/Zdi7KPAXG+QwWz3gB/wdCmkdtUb5FBR58KGXSOJ01Nw88hC6z5ryA8WiipGYeqVvP
         nepBNuSuXAKKoWW7CMh7nmy1TMqF2w95RIQX2EBUmHNC/+7ipKFVXXPkKVmePolWh311
         4oaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724772470; x=1725377270;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7V95t9Eny7FjX1177LVW9tNDMS6rw8HF+Z0knd4Kuc=;
        b=FLcUIGhKphydalryvXxc9yON9py7x7UqOYIwNGwuSwIPuQ8tz/GIaD8H8/DAsNwebU
         qcHSpvQS0WaDj65khIiXcsLFUjMuUfIk8W6FPi32y0ftZLkVNylJaszu5UbIsVl2v1aH
         D6I9m413LUP4kbogXzwpugsqCs1tnys3Ut4etGboRYUK0fyCt7T6PCQZEpwFLho0FiXx
         NKZYlX6AyoQZnb4BZWiXcr5gucPfgw3VzZvffMYSgTBYyeLq9ZpTOdcxo8FP35tArQX5
         KVNCZQNmnGCfT5xqT9rdbU4Rh9zb9OZ4/TmMcHiPR4CNqwSZiVenlEGKTJ2ceLIDGBmb
         isKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaOucwxbNRxsIDiFZoAIb20Ue9hCCZ8NFsM+SHRJNT+tO7UjAtz5j8NYyXPuFky8alOwOGna1WAH0UqXYnx98=@lists.infradead.org, AJvYcCWhkx5phBKSHbM1/aMuDenTxx2pP+tN1VkBa8dq5Qae0Py0BOq1Hd8DT+rpm/mdpC//6iXuxtyqf7PJZH1RZ+W2@lists.infradead.org
X-Gm-Message-State: AOJu0YwkT3InIgCt2ET8vvJRSlYY1qUK+Rey8+d+3WrU2En7PODPOJe2
	J77BLvnaDwzg8VTxGAJiy4TAx1eit4hH0+vIYFx7h1yKhKsvQNfgMqfA6Q==
X-Google-Smtp-Source: AGHT+IEPtmV8NBgh9Dnh9bO4NJM4SHx6FsWwQbk1pW18vK1HMdArx/2c73ChRv4IRCQbzDp60q+6tw==
X-Received: by 2002:a17:902:c404:b0:203:a0ea:6265 with SMTP id d9443c01a7336-203a0ea6d20mr198925725ad.11.1724772469523;
        Tue, 27 Aug 2024 08:27:49 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:fce4:8959:e48d:980c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855dd2d7sm85222915ad.169.2024.08.27.08.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 08:27:49 -0700 (PDT)
Date: Tue, 27 Aug 2024 08:27:46 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Liao Chen <liaochen4@huawei.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, mkorpershoek@baylibre.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH -next] Input: mt6779-keypad - fix module autoloading
Message-ID: <Zs3wcpJ_vVmOXbIl@google.com>
References: <20240827123411.431388-1-liaochen4@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240827123411.431388-1-liaochen4@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_082751_579276_7A7AAFB7 
X-CRM114-Status: UNSURE (   8.12  )
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

On Tue, Aug 27, 2024 at 12:34:11PM +0000, Liao Chen wrote:
> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
> based on the alias from of_device_id table.
> 
> Signed-off-by: Liao Chen <liaochen4@huawei.com>

Applied, thank you.

-- 
Dmitry

