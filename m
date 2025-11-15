Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A72F7CE8D6B
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Nov 2025 00:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MY79eneNfrMG9dz4hIdkivq1gZvCTrtfj5tzDev1p4M=; b=GIjGj94dWpgamdyueqxxV/nRyp
	nCXa//rMGnjysixOMQie7j56/DlcJGi1I0D9B42Q4pbPRyy79As7JVAOs4agXWq5zbAO3z9u5ENNI
	TY329wM4W5QpDiLtTSnfFeelrb0RQjYsjldelFLPJrp2Ww72M3JJfBNCLn+XvKauiuz0CmMegU9Mq
	aRCm5G0YJZGnTFAxtWiVFoJxkFblLa/Hj+3r0n9wUDHeAqoe3H3/IOhFNKrvuNSGtmjkuMcd1RPnr
	5Vn75qzX2mSBd0SUYx97EQgnbKGvaYgMwNqJEOsxzJv4B657gXmr4/Jmk2Xds/xazy8RksmNAouIY
	rJss3sHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK48y-0000000DHHs-1JDb;
	Sat, 15 Nov 2025 00:27:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK48t-0000000DHG5-0nn7
	for linux-mediatek@lists.infradead.org;
	Sat, 15 Nov 2025 00:27:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763166468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MY79eneNfrMG9dz4hIdkivq1gZvCTrtfj5tzDev1p4M=;
	b=F6P/x9aCvDfl6GcuUO7XUBHxvBrAibq0xTTIi3MlvdauPMmV5/mNMdGsgv8YuQ/e/qLajD
	J4mU349AewLwzU8iTgREZBE5gZ1Vf5MyW6nAHYTMBL2sp9UpkMW9EMpLy3AM9qyJeTQNH5
	rzFl4+kY5DyXb4qUf6/Q7QMRXfUCd60=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-394-U9-tvnqwPIOl9DnjiOgMxg-1; Fri, 14 Nov 2025 19:27:46 -0500
X-MC-Unique: U9-tvnqwPIOl9DnjiOgMxg-1
X-Mimecast-MFC-AGG-ID: U9-tvnqwPIOl9DnjiOgMxg_1763166466
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8805c2acd64so78804676d6.3
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Nov 2025 16:27:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763166466; x=1763771266;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MY79eneNfrMG9dz4hIdkivq1gZvCTrtfj5tzDev1p4M=;
        b=VzanKzb0GSLzmKh8CW/apF+mVI1jhLLYxqUJJibC2jVVFhj2mzvecuzkKexq1T062A
         mv5q4V6aV/vOH8pw+XofgWIIgW8KfGu7BRwSFWxU0pEGipPKHu33DgLZ6aB1pjIL32QE
         CA2KIFkHqO4vSvxSHlrtHiy2JNAap988TGi7+H8rWEiLdaHEahU+KEtK9k571XDhWjRj
         Xu9Hw7MWisS9KbWdOo5oaRngEl/1pSfBNqg3L8dxs+s7XekqLOYdZqgpafk9PxjNlrse
         L3A5W8FJUllxim7GeUyHBNnX/EjrNv1Bi5RXsyxHl+qf8pXJ/D0o5ROSlfe6mhwqeCxH
         m3/w==
X-Forwarded-Encrypted: i=1; AJvYcCUKQqigv2NKtwZ8g59lod0w6sR9Yi8S9sW9szyA/xvDbxnLz1f9BoB614ESXrs9jT+8fkdpGCmUpIEy2aVh8g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxUZ4+9C3eM7Qx1erJFsEyl60jsjYfXyNq+nD1ELMYWNbtzgfZy
	T/bIzq3X0GkN9LWfoD9ykzmw0jAF5W5v6gfNuvLBMx6h4Kn1vmaGeXxVlJ8e8MSiDwiZRZbrJwU
	Gmd48sYJ+YZc8QROg9A/kS+Vf1nqjQ1wxSUbu0IkDaahG9a8Y8+9ip69f0V/l22j7d7/UqKtWBQ
	==
X-Gm-Gg: ASbGnctrqWhRWrFOzoxzKcWY5bncWvbxBReM+X/QzD3OGHAjPWfwmZOITeqwG9cqlEQ
	3RqhyMxswAnePrQQINQuxjnVkIMkbo7a35f2LZz62g2Xs+HVokqSv5i7lTZqwjP/ApWsm2jsY8l
	dEZvybjVMFXGB7HK2XAnFUIu1/6m8dz1oq0oY2sdBF+DxhUX0gfSbw1k5gN6NyRn4RJPaCldMWv
	k7D+k7zxqD8IKUleRSZFCLzL+Lnwfs7KHp9xps5KDMAU7IsmSF9AVpMvzON6fS8b6TbZ6HPwU0N
	fFAdS2Qp5650Pq6vb44OLLY87tKxITqyri878KAqjm+AcHAjJI5J1FlJo3oC4MywS1RZM7xSwQ1
	fTgHa5IBr0geuPG0YSVqcIYo+wMDtXKHzPePd8VJbF10Z
X-Received: by 2002:a05:6214:5014:b0:882:4be6:9ab9 with SMTP id 6a1803df08f44-88292705010mr65042216d6.54.1763166466359;
        Fri, 14 Nov 2025 16:27:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGraWChEBaQ8Kt2DRqLdXdplufLvs8tWzEMELdXUg1GXFx2RN4xE4J+31DR8rAVpI9IzMPVUw==
X-Received: by 2002:a05:6214:5014:b0:882:4be6:9ab9 with SMTP id 6a1803df08f44-88292705010mr65042096d6.54.1763166466020;
        Fri, 14 Nov 2025 16:27:46 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8828659e0fcsm41781696d6.53.2025.11.14.16.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 16:27:45 -0800 (PST)
Date: Fri, 14 Nov 2025 19:27:43 -0500
From: Brian Masney <bmasney@redhat.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>, Stephen Boyd <sboyd@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH RESEND v2 0/9] phy: convert from clk round_rate() to
 determine_rate()
Message-ID: <aRfI_xT680E7Cf-o@redhat.com>
References: <20251106-phy-clk-route-rate-v2-resend-v1-0-e2058963bfb1@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20251106-phy-clk-route-rate-v2-resend-v1-0-e2058963bfb1@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CLxgoM2NiG4Go75iJKvH8FCWtaaCMesnwR-iwmd5SrY_1763166466
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_162751_294602_4977DBFD 
X-CRM114-Status: GOOD (  14.29  )
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

Hi Vinod,

On Thu, Nov 06, 2025 at 06:25:46PM -0500, Brian Masney wrote:
> This is a resend of my previous v2 series since I haven't receieved any
> feedback.
> 
> https://lore.kernel.org/linux-phy/20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com/T/
> 
> I'm hoping to get this merged for v6.19 so that I can remove the
> round_rate() clk op from the clk core for v6.20. The clk maintainer
> (Stephen) mentioned this work in his last pull to Linus:
> 
> https://lore.kernel.org/linux-clk/20251007051720.11386-1-sboyd@kernel.org/

Can you please take a look at this series since rc6 is this weekend? I
have almost 200 patches merged in other subsystems across the kernel
for this work since the Summer, and this series to drivers/phy is the
last one remaining that's blocking me from posting what I have to
remove the round_rate member from the clk core.

Thanks,

Brian


