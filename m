Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588A8D3C934
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Oct 2024 04:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AoRk7upsfv9NWt7MBCmfOuNRDL4bBF9fcV9bVsrVk/0=; b=ieTx4nZHxrl53QQzcenV3DqVG6
	LtdVNQzcnJXguIVvWjxn4T7i89GJ4EzNFN2wlJTBApRBTZpQf4AORTtBptzu3Uad74EF+2WI82zfj
	1+iTA8ZlK56jhU71s8ttAf6+KvYoOltj3YHZk612/hq1HCeSBpUvb1x9x8DXoEyq9MNZsJTtMhBE6
	a8ocpHygkLBwujqhTra97L+/9E/+ewHS+439Mo4Qv5D43uPaIdgkbcq3SeSNFPYR6kzpO8GxcxoDh
	8GjYpmEzhThZHQYzY/g7EO1kqKpvjNdxDDJCz6+g/cREv+3djkXTC10c40NtfbenONCoNsItG2ViY
	ljepFCCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2N7p-00000004Ln0-2M1K;
	Sun, 20 Oct 2024 04:01:05 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2N6I-00000004LaU-0Yv7;
	Sun, 20 Oct 2024 03:59:31 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-71e5a62031aso2367171b3a.1;
        Sat, 19 Oct 2024 20:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729396768; x=1730001568; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AoRk7upsfv9NWt7MBCmfOuNRDL4bBF9fcV9bVsrVk/0=;
        b=Ru9H/NpA6mrsgXxmra4Ywla/tp/7d9/lMVECdBHS0K0CTzsj8QC9C9l06WXLbeqsHG
         836q7IxmTH0G1ilua5fTSDqBRyY6rZlc8TI9DERo+CsYT/JoQ10hcW6NP1WpFi8mec8f
         3mk/AI88CjeiIN4kCjw2yrChplS0UMnu2t7v/nJoLO2eP9ih/ByQpC6TyzL4O8XBf4ZG
         b+KaJkC7w8RKfQkDRYUrKYk5/kbI2elgZVAbAkNonfeuMCXSD0xx9zqJERjjaXkcgEQk
         ALpKvWqAAz5izehXNiRyhQvdJQcHBDBaSBivQuwd7tSqVisqZmXMovzrDanelwDHd1Wx
         9E/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729396768; x=1730001568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AoRk7upsfv9NWt7MBCmfOuNRDL4bBF9fcV9bVsrVk/0=;
        b=ttAlcyK29rDrk/1tzVzwSUzSFkryida0PCD7Jw7L5ld+sX4MmGFQkjjWly+rkB5bKA
         P4qVPYnyuNmfgH3R0BfZDXE2VXR0LD9Xg1IBWyxIukIu59UawznqNU2KJbz7fDJuGia5
         /Hs4t6GMtpZqajfOMA3Jwi762GuZqMbSSm14ZFtOIEYymL7Lb/qDgjuL+QDWf1X9bOpB
         j/DAwX4X5EBIGnQanM4rJVAJoQ5xyhs2/WV8WI6OP1YiFV7wJwIDPKbWRlm34I9dxVqn
         k+ruMd6iuaDpCzvfHjNMiRgB1On3DsMihqFE4bukzZ732kQGqnbEQlKeGzQiW7FKVY1n
         Ca6g==
X-Forwarded-Encrypted: i=1; AJvYcCU49BxDi99h+Zs2/qHNT3akMzPubWD2rHfxzK1n3ThqWGnczrhrg83skNh6W0UHGtqYPjSvM+pWG0c0+tALXNE=@lists.infradead.org, AJvYcCVlm6ft3zihBNCKa7ZSQFy1DN1EIM0y1DeSycqeduP3p4LqwEVtxH7vO8n+AusiClxad3bifyJBqviZnwZfTTVL@lists.infradead.org, AJvYcCXTJL6pESX8cbfzNCCSsbCmruXzWrtFen12raRMvYye9uL0dTKwlHi4orH7ZcCZjvjC/bUzzcrDiHOCGkEG9Koqrg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzhXFoj3W6R6AhoRS5SQBKZ74+7EyNc4TKo+c6gmBzxBzUHt20U
	2IVO+gVqHId2uBd73z3QFeODz3rVwjf+zjYWuIWCkuYsFeHorswl
X-Google-Smtp-Source: AGHT+IEauN6DVG29XwxoUu8C/NrTja4DP2UcbOXGEqzr1/C/B8/WXeDTqF9qwFarcPA6JhNmwEv9Ag==
X-Received: by 2002:a05:6a00:9298:b0:71e:5de:ad6d with SMTP id d2e1a72fcca58-71ea323b91dmr10395281b3a.24.1729396768251;
        Sat, 19 Oct 2024 20:59:28 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:2ce:a853:5ea4:fdb6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec1415bd5sm468654b3a.187.2024.10.19.20.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 20:59:27 -0700 (PDT)
Date: Sat, 19 Oct 2024 20:59:24 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH 01/10] Input: cap11xx - switch to
 for_each_child_of_node_scoped
Message-ID: <ZxSAHGCAg-cDMo5D@google.com>
References: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
 <20241010-input_automate_of_node_put-v1-1-ebc62138fbf8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010-input_automate_of_node_put-v1-1-ebc62138fbf8@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241019_205930_199319_C9DA682D 
X-CRM114-Status: UNSURE (   8.55  )
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

On Thu, Oct 10, 2024 at 11:25:51PM +0200, Javier Carrasco wrote:
> Use the scoped variant of the macro to simplify the code and error
> handling. This makes the error handling more robust by ensuring that
> the child node is always freed.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Applied, thank you.

-- 
Dmitry

