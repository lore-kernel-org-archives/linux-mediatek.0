Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93220D3C934
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Oct 2024 04:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tptjKfYEQQF+U0/Q+FaHDkTW1qtsrHC+9O21DSZ+nB4=; b=gMDsFExQLnarleTENjNxPKsy3g
	gpEzQciwPl6MHeym6XUfwBvrm9AYs0dg0kmzhvvoPNfgserPtrBZB3SpQicnwOXicFpIzKWrQWnmp
	9QvAENA2EaoFzNkSdr8fEtgEgvjX2f4hWQwZNRiDOBl1NkN6QQtLWExKSQ8e6BENJTtHaz6Eo+dMY
	9vIUh1J7XgK4BJILcckXJzYutoMIFMNcB8nEejXrR8BKj1R8LqP7mxA192zizqzxutFmKTdcFgrhV
	P2BeOw3yRXvIudIu/mIlp6s+DLkiqA/oemM3V4cWX3ynXMIVFGfNkO0Mcer16P50biqAL+xrkbeCV
	Gwg6jjVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2NSW-00000004OWd-2pHY;
	Sun, 20 Oct 2024 04:22:28 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2NQM-00000004OEA-2RAx;
	Sun, 20 Oct 2024 04:20:15 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-20c77459558so29536455ad.0;
        Sat, 19 Oct 2024 21:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729398013; x=1730002813; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tptjKfYEQQF+U0/Q+FaHDkTW1qtsrHC+9O21DSZ+nB4=;
        b=hazfwjtJ0PK83C5rk+aKWP231HndopGxLfaMhu8waVjs25DP+kHnGgiKLi8nWwfAMC
         q4PBjfwOhiNTYvEdGm7Vsoyy8BkZqpt2xrJ5RfPQGWDr/fQ92yn+UHMj6vet1+xuYJUw
         j6PO/XQeliIZORcNBKgT0Lkixy8PuYjIV8R5ecVkzHppJPPnWUzkUhPPotBbX9FUt5rJ
         UCJxsqxTcVEVO/yeULBgETdPB3/DX4kvNLMAUZinzzpz5DR9EUqxSXXo6IdKF52gNNzQ
         +WWkMVA0dW2xDREkGS9qxVbgqI5pd+PF3ltRPsH6gjW9uAK6iWNV3dEgq7DiFBaVvzUf
         8Itg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729398013; x=1730002813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tptjKfYEQQF+U0/Q+FaHDkTW1qtsrHC+9O21DSZ+nB4=;
        b=oLoTWy47ydt+ZDEvxfgPCG/vyTMlxCaCuN0o7zR0Asb4iVk2JY793FYHBUFuVtyeoy
         te0Tsmdwwj2PxRovxqX3Lo6odNURDvKD/qpDLWwuZK68/mVy6Vf7Lup/I0St5k80v3K+
         deFeGR1iqTj9kx6ocXioRFBWOI3duCOtODP0BTP3pOEfr+gpTD5gBrM+esUUl3ft+XYM
         JjZ45Tndzb5dkLeR6r4ixYaBtSVPw9jqvXc/zwji2NF1LSOiY4HUGXX4yi1SQXWmR71Q
         awKoJkdXessUdpE25q3y7J+k4/gHJ0812haHivWje+xn5r+ASEctPOX98l4WFKHe4AfH
         C4bA==
X-Forwarded-Encrypted: i=1; AJvYcCUw3O0Qd813+/Tebfr4NRriDEAwPw7EhnwC1ctG6YJdRksniVGKZ24tBrQc35cc0ypXX9+97PuVP5MFEn6TjpgcPw==@lists.infradead.org, AJvYcCWVoKgGIjTKMuepFK9Tf2Yn/C2SFlw9RcenU4aerza9y97wSu4yB7vOozTkXJpzE4KJyxz98aXxVRwa+gQNIUU=@lists.infradead.org, AJvYcCXhXzMpN2pj6jNcjAaNMHwTQJr04QnkOSnFF9okT/zQXOrGht+UcV0EAd2dLqDijxcEQ+5usN6iMHHVF9mcdyHn@lists.infradead.org
X-Gm-Message-State: AOJu0YxEIaDRi+ULJI8aQTd9zeyANmmxZ25YcV1IqDLPz8rQJDrsXbW5
	Y0Vam4I+zs0h1YMBs/ZAJmvDQAiPh666EvUvxylbQWGLIMp15h8x
X-Google-Smtp-Source: AGHT+IH4soPnB60xIfxMOaiMsildnpr5Xj1NAwq8oNtm2eFEI+8djQ/DtBOvtVOIoBtzygMoxkZyLg==
X-Received: by 2002:a17:903:22d1:b0:20c:5cdd:a91 with SMTP id d9443c01a7336-20e5a9338b3mr105516805ad.41.1729398013446;
        Sat, 19 Oct 2024 21:20:13 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:2ce:a853:5ea4:fdb6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7eee3c88sm4452675ad.43.2024.10.19.21.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 21:20:13 -0700 (PDT)
Date: Sat, 19 Oct 2024 21:20:10 -0700
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
Subject: Re: [PATCH 09/10] Input: raspberrypi-ts - use cleanup facility for
 device_node
Message-ID: <ZxSE-iBTWc2ZRfik@google.com>
References: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
 <20241010-input_automate_of_node_put-v1-9-ebc62138fbf8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010-input_automate_of_node_put-v1-9-ebc62138fbf8@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241019_212014_644736_6758E95C 
X-CRM114-Status: UNSURE (   8.31  )
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

On Thu, Oct 10, 2024 at 11:25:59PM +0200, Javier Carrasco wrote:
> Use the '__free(device_node)' macro to automatically free the device
> node, removing the need for explicit calls to 'of_node_put()' to
> decrement its refcount.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Applied, thank you.

-- 
Dmitry

