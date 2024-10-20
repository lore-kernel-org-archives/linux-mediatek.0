Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA1AD3C934
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Oct 2024 04:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s7Eyn+wIU2lg/soYhO35E8VzHPCZvDEk6KGPQpopCtY=; b=IhGimu/c7Je1QJCAtve4t86Q+G
	Qt0AyNwiKhcURX72ecDMq0i5NNUlrwuMyaLVnO3qS0FdDI52+leQsjZc7pCbF1wujys9AH6pJ7D7M
	l4HTCYBiDCfXYRyug8j9XIxOaei05QKJU9kCE1MelXaWbR6WBzc+9ejhpASJwDRq10cxJRcM/0QMb
	Qpz7Dez6HgvMrSsve6NH6NSS3EG95L7PvgUN4UWKQ7Cg8V+qvv2uozBJr0wqmUla3E7Tpg8dAdx7w
	+woi1GZTsoarouoZbdORdyQIGTjy7UxOYbY8XIbadLGjWrR9DDY0JF0+J+KvGZGmegUq2whdxxOda
	g55s7+UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2N9T-00000004M6H-1t7D;
	Sun, 20 Oct 2024 04:02:47 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2N6u-00000004Lg0-0D62;
	Sun, 20 Oct 2024 04:00:09 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-20c693b68f5so36169255ad.1;
        Sat, 19 Oct 2024 21:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729396807; x=1730001607; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s7Eyn+wIU2lg/soYhO35E8VzHPCZvDEk6KGPQpopCtY=;
        b=ageIzHNYxvttUBFKdR0RC7qeA8uj0dwfnrxFX2bqi4arkRWYfHB4iiNYLio6gZ5xzl
         Gp7wWGzoxowxcBtdQFT3qekarYJzOI7HMTtabAZzNitba9WKin9iM7gm8V/bgvMvTc0i
         sXqNzI0ECWcJijjeG9EFnD611Z81D7nxqipS3INIIQgkxWffZktDjS0DaCfff85iH7zh
         Eh5KKiRzDn2ls8afelS9QrJxZ7gbZD+kJKtO4Bp3FjsGQoUDPGpyLWfqPDZP9Gjei3NB
         xhUaSxtK+UAbQx6v5d3VVNgIRWmsetTOGjslbe1unY6rmT+vEbu0sWKr2GG0NIezJgF8
         DwRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729396807; x=1730001607;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s7Eyn+wIU2lg/soYhO35E8VzHPCZvDEk6KGPQpopCtY=;
        b=kF3FoWvd3Hca++zIjWBv8cHAaOZOraqxzSjA5k0lPhfHN05Z+8fBTzemdZvvTkaj9x
         fbDZmQW+Se6cQYw9Q4FBcrDQZWptunW/DILxOyNqhMbjyCFJGqGdslj96xxKvzhK2mA6
         sOzIKNhdi50o5w9aJBUrPJtBmJoZDM/wyAcrIrEG4NZkX5FF86KAWHb3bSH831p1muMA
         K05AwP2UELNaJvxMfs48h3Ypd0jNsO8PkJxBmpU4NF9Enwc7h+W+/3Bus/Qpxs2wnnx0
         uRQuQLaL4zw8eev1pXlO2ZPBAMZqMkkQ3HwUmeBxHZttA863IvV00oU+2fdznnKICLfw
         tcTw==
X-Forwarded-Encrypted: i=1; AJvYcCVD9yzPXvQvydcFgRisg4Qr+K1Md8lbINI7vRCT0dhWUSovyxto4VWfzwHjUp2TBzo825VGFzYfSxIvERj1fY7raA==@lists.infradead.org, AJvYcCVEIb8Wk1AbhSg2endhQDEuLR9AMiQR8aDAzZR0DxsA28KQDmtI98oxp1Ezxv2HuMxS/QJdlTYA2lH1038uYLXx@lists.infradead.org, AJvYcCXuQcs5he8VQB8mwdyxfsf4nZ0zasT1UCCs7eHzrQsv6GAKycmDWQebGWecp2/Gz4Y0vjQCAIZ1vQFwcDT+XR8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxbdbuPmFM4dyX+lWSe+FE373Usc30IxR9aJirKCKvAMC7+xwui
	vHwMy5rbU8H1I3lLvnj0xQxqHr2ok5aw+H3rzkXYxc+fyx6R4qdt
X-Google-Smtp-Source: AGHT+IFl8N79KwJNzpiOSvPNhcTmGipFG8auJpRWECmsOLXRx2Y646qdQOyM5pwoW9JzQIeTiIpfBQ==
X-Received: by 2002:a17:902:f68f:b0:20c:ce1f:13bd with SMTP id d9443c01a7336-20e5a75a5b9mr91972725ad.18.1729396806850;
        Sat, 19 Oct 2024 21:00:06 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:2ce:a853:5ea4:fdb6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0bf197sm4182235ad.150.2024.10.19.21.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 21:00:06 -0700 (PDT)
Date: Sat, 19 Oct 2024 21:00:03 -0700
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
Subject: Re: [PATCH 02/10] Input: mtk-pmic-keys - switch to
 for_each_child_of_node_scoped
Message-ID: <ZxSAQ4rWWapwWMRC@google.com>
References: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
 <20241010-input_automate_of_node_put-v1-2-ebc62138fbf8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010-input_automate_of_node_put-v1-2-ebc62138fbf8@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241019_210008_115682_6B53C39F 
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

On Thu, Oct 10, 2024 at 11:25:52PM +0200, Javier Carrasco wrote:
> Use the scoped variant of the macro to simplify the code and error
> handling. This makes the error handling more robust by ensuring that
> the child node is always freed.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Applied, thank you.

-- 
Dmitry

