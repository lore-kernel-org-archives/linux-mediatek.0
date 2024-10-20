Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A13D3C927
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Oct 2024 04:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QdxAZPP8tKBd9xy8wdHQraowerxPEW9BPsKjH3hJ3d0=; b=mSvNf0YfvN/htIq2nAJ3nVRe5x
	S7KtfAfRtv6CioMifP6nmMWdI3sPklkePx0vMnBf7V93rIOOgeWrxUcsgFGreQmpq5x/CN7OhIVuB
	5+3pXVw5QboWT/W+pAnNQFJGuFW8guMu+WkwPISKWDwUp/29k08Od04cCL4YfXE//EIIpGLoqEZmD
	sOPP839t8NgXVq7b3Yqtis8euukzFDU+GGxFrgYpUnJveQqBlQQZaxLVqG7/9xUgs6BuR3RK0tljH
	9Oqwgitq2m6/gZX3NFK25nhOX/UU2SKiGvp2fG1coyf206+S+S97k77C/k97p+0R5MAB8Od6HQ2Th
	1g4DT7AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2NQs-00000004OLQ-2kaX;
	Sun, 20 Oct 2024 04:20:46 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2NPO-00000004O4w-190V;
	Sun, 20 Oct 2024 04:19:15 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-20ca1b6a80aso31081485ad.2;
        Sat, 19 Oct 2024 21:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729397953; x=1730002753; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QdxAZPP8tKBd9xy8wdHQraowerxPEW9BPsKjH3hJ3d0=;
        b=FeLVqhSERqqEY225xrML58jhWg+pmr2tCwwROnjimo4wkTr2pmtqeqb9O+oyR+ukcd
         sqeOAbJ8DZjkNhIFZIXjszJ8nCHSSSYbEH1OsOLRiRBLxW0qPmxTZicbNUNw6zuEUcMR
         7X6iwzbJqXAuKh8U94SQDNXVqHXoMu2/jzluBTDimloEPiY0Yz4bN4W6bvLy3k97F/w0
         meeqVHDfQtVh5ShmU8nuISPJxSEZ874JGM0Rr9Q1LYUhjh8fVGvwTKuKPOc0tvtR/IC2
         WZLv2uGZVoa99I9A+vU4pZIJ+9VKg59Mv7FgYHYEKx4A/rrISoFYSzp9rJHtqz4TXnS4
         yuvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729397953; x=1730002753;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QdxAZPP8tKBd9xy8wdHQraowerxPEW9BPsKjH3hJ3d0=;
        b=VQ8s1/JERinVm70kJc5J0FNyZHuzdxNseyQ3yJD8Moagb8LBpPJC++wXW5HQebzo/U
         Ogpr7ZZy6TTcZX8T7N2hYnoDD5DrghlPnIHmwD8QATnsRc+p1bsVGwZhm8EqnSY/uNu+
         Ow3VGatiuM61ogB7L8CcfkIx/RcKAzzcOejaGhs1yHZHXBDJytVzHapsh5UcIg2LZyCi
         zbOqKG7603OtF3PovHl92XOt/VOKs0T630wjgyrP+5wRuQl7Y78mKtJLu/TGlS96tNIq
         xOH/1xUF/6DauqBuVVuF9rshNz2Y7mGsvT4sE78mrUqnGr4hd6huvlZonME8Q7RJwdo5
         GfDA==
X-Forwarded-Encrypted: i=1; AJvYcCUlv7Fsye/OmLXM8XewetFXdpjwoZKXFURLYY5Or4RS601dnlz3ZOJ6QjorVOWZ3n5OKLCymaPeydUmCcHT01F6@lists.infradead.org, AJvYcCVzSesX+pISbCkdeuPftmg/Y9kKUfOCsEYqP0xFX10jxeyiF8tqJ3PD27DThZjN78GdNXixFmUmRqVsrd3/xyuAnQ==@lists.infradead.org, AJvYcCWI6hQv2rTev1cGi6MMDERMPNV1dLnxNyDUPhMAqAHq3HUaJKzPllkqBeYS0k9i58LGEj7H+j84sEEHsY1VJL8=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywqx6p7O3LeqZ1AYVhs/xhOpXvZiySRna8WaSADCQ4eCCpRClKC
	PkTgdoQz5nD5QBWINM4fUDYz2V1SOkvlaVkVcirq5Rp0QzJcK+fW
X-Google-Smtp-Source: AGHT+IHBIvWZ0uV1GR/m50ZQ4x/Hdm7GgkdXXrNd1kKqUe+bkuGv8vNm+r2H5ifXOrMUDosuFRD+2w==
X-Received: by 2002:a17:902:e811:b0:20e:55b0:35f2 with SMTP id d9443c01a7336-20e5a737077mr91778295ad.1.1729397953103;
        Sat, 19 Oct 2024 21:19:13 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:2ce:a853:5ea4:fdb6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7eaeab35f8dsm545377a12.31.2024.10.19.21.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 21:19:12 -0700 (PDT)
Date: Sat, 19 Oct 2024 21:19:09 -0700
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
Subject: Re: [PATCH 07/10] Input: 88pm860x - use cleanup facility for
 device_node
Message-ID: <ZxSEvZK-1ydmUIxI@google.com>
References: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
 <20241010-input_automate_of_node_put-v1-7-ebc62138fbf8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010-input_automate_of_node_put-v1-7-ebc62138fbf8@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241019_211914_364706_F73A07A7 
X-CRM114-Status: GOOD (  10.00  )
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

On Thu, Oct 10, 2024 at 11:25:57PM +0200, Javier Carrasco wrote:
> Use the '__free(device_node)' macro to simplify the code and error
> handling. This makes the code more robust by ensuring that the device
> node is always freed.
> 
> Drop the first assignment to 'pdev->dev.parent->of_node', as it was only
> a shortcut, and tie 'np' to its usage as a child node.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Applied, thank you.

-- 
Dmitry

