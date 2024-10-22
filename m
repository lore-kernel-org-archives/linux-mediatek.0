Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DDFCCDD0F4
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Oct 2024 21:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rGcVubgeABd0/PmmPiE/7qXUdJE2sMJ6ZOzH8qpp0iI=; b=4Q6irouE54D5RJo5bsQvlCY338
	ju31/Bq54SogXK8u7Dx6VAVeh8sGMiNBUFtyv8rQvPc92eM2cY7Liaw+e73a7Ak1bt8Q2uXRH9WEF
	kQ3W8x/cURz+WPlXYZ9Med5wM4GvA+1BgvGlEb8dtNGLgFHjbX1+o4wvLfpkcgaftr40RO8DEaUPE
	rvPqn4fVhWvrv1qvH0wRr31GWjbd4VWRjAFkbKL0QXNtoi/5XDUtGP3NzjOz4snUMOO6ShjAvyuAD
	i5YEfXdawaQt3lOm7ATME6fdOdaP6MQqwevnZE9jWzvEqs1o/dVcDYGhluYogLpBelQaLudpU0TMC
	59pN1pcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Lzk-0000000C9sf-3U1y;
	Tue, 22 Oct 2024 21:00:48 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3LyD-0000000C9fy-0loa;
	Tue, 22 Oct 2024 20:59:14 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-20c8b557f91so61145185ad.2;
        Tue, 22 Oct 2024 13:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729630752; x=1730235552; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rGcVubgeABd0/PmmPiE/7qXUdJE2sMJ6ZOzH8qpp0iI=;
        b=OIfDhVktHfadgV9LNT6DaZBbnhhAcpf1P83wXzN+UhQEhGV5qFj2Br6SpOjA1Q3I/H
         yS5R4hSgcYYpP6plVzIZ/gjf5GGbAILhwPwEcOJAhfGVOPDDTGkeb6kGrr2HRQwTSXks
         dbovfxsuA92zuW1XSy8NevYTZCNQzJ0jvc6RqcHEofGGtWYcYK322+MKx6s1jIhHmHQz
         44i4HyK6hbCslKG/CMEF9NKZa2r0fqXXyu/WlMADJKh2UKy/kicyap8XQWALMozzHjmO
         mlPzdU6y1PGhJUSJ125QPoVQdnNUBhP7Wn9S3nJYOVqewpVC8OlVvLKmX0HCnio9uIqz
         sRnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729630752; x=1730235552;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rGcVubgeABd0/PmmPiE/7qXUdJE2sMJ6ZOzH8qpp0iI=;
        b=KbJGMU/9MNp+29+Lq6rp7TJgW0SDiYify4f93Zq7JDGgmDUgs/PHtKL7fETRQlBK7G
         AnuCjVRTnKfaEnf6zArf2APNyINfheoIF8AIjYvgACk9m+OAEdw10VxZPR86EpjJtVGa
         zosTA9rbZQEEOOzmRSG7Dh0d2vc4yyicNYqkg5QPCMlNL31M6/8703J71ZBf09jyWIAI
         aieD4C9lVf4eESSVx1fXfWtxxP9PrnGuyvqMvvUtIAOZI2XpCdMd0aAX2TzOJMJvJUcM
         41cjxLLwHa9Ve51e2DxJ30fdwuZpSlaAMpmrr3Cnxsq43vbZYdTLg44XcPi+zWX84Yzo
         6zrg==
X-Forwarded-Encrypted: i=1; AJvYcCVcC8V/3e7MCGzkSCb6EOoN0X2Srgf42hqotZTbv1Nyg979yTVWnvSPZ8Q9P0YGxYwfCgdlG+oNElWbYtAUDH06@lists.infradead.org, AJvYcCWB0yCLHTJKpZ/93fmwO9+Mm4REJc0T0EA8F1czdl1Ewx8oI3kn/1RsmG/PbRUY7RE0rYErgjP88jKxG35m2oU=@lists.infradead.org, AJvYcCXuyeBQvO2aL2Tt/XNro2LeTelrKGsmEhr9lxTM/FwP83x+dF0YGosrER5G8IT5QzuVJ851lSfGN8KUpCyWvDolEA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxRlGANf9svj0f0L3t5dR5M1+exdg7hpo6E9PO85N42M1MRFzln
	ftoYG7lX+tkZXEzAE95yyMF2bHAhMxYMGPD+KZ9uDWvtK/jhT+EB+3uW8A==
X-Google-Smtp-Source: AGHT+IGJNU/cLwbWsuoQCsE3dJTP2JypH6Hr2f1MS7P2CbI5aJ0sG6TzIyW1dqVhAweQ4wLOdWoaaQ==
X-Received: by 2002:a17:903:2312:b0:20c:ceb4:aa7f with SMTP id d9443c01a7336-20fa9e298c1mr6239915ad.11.1729630750519;
        Tue, 22 Oct 2024 13:59:10 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:94ec:f4e5:1552:e2cc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0c0e2dsm46581055ad.123.2024.10.22.13.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 13:59:10 -0700 (PDT)
Date: Tue, 22 Oct 2024 13:59:07 -0700
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
Subject: Re: [PATCH v3 0/2] input: automate of_node_put() calls for
 device_node
Message-ID: <ZxgSG55LUbw08mp8@google.com>
References: <20241021-input_automate_of_node_put-v3-0-cc73f636e1bc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021-input_automate_of_node_put-v3-0-cc73f636e1bc@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_135913_244902_7BBAE8A1 
X-CRM114-Status: GOOD (  11.19  )
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

On Mon, Oct 21, 2024 at 10:28:22PM +0200, Javier Carrasco wrote:
> The first patch of the series provides device managed memory, which
> simplifies bbc_bee_probe() and removes the need for the goto
> instructions That also prepares the function for the second patch where
> the cleanup attribute is used for 'dp'.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Applied the series, thank you.

-- 
Dmitry

