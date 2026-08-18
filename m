Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B47F8C5DF67
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2026 03:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fmj8lP1yFjzbA+ervTx82nLhcjYdqK4FiTBNDHNyFKc=; b=eB7nxXBGXwKYSRyqLQsu8rzpZp
	TqVwUDqwUG81dty6TJY1U1JHq3n6pL0Xdww5nfSRuPDz82Nq0ZP5/VDaybxU0coAP+YJOFHWvDTFJ
	7wSW0SiRvRLRBdZIpQHuLzG4ypertwSL+y/h+vWev2MiJe7AkPfiJYTaeifrT4fgCJec5Wk0VyRpn
	PC8gkjWjZTvx6BtiBet1HuZRzFVWIVbRBKyFI3Bjz79IoMuY/4COYqY4uei6FXTKD2w5fAP8pb8zv
	cRXBO5JFWuaqHphoP8H1Iqkan4PLRmqoBvHS2IOeR7WRnn04TizTAcDY1fT/6EkyiNmeMRAo8vlNR
	DzaJRVxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwANv-00000007Afc-3NAA;
	Tue, 18 Aug 2026 03:21:07 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwANs-00000007Ad3-05c0
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Aug 2026 03:21:05 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-90c50c2a257so2168966d6.1
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Aug 2026 20:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1787023262; x=1787628062; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fmj8lP1yFjzbA+ervTx82nLhcjYdqK4FiTBNDHNyFKc=;
        b=JUD6EUxQ0kM21TROcgBfdOmCHb93vWRApbSrkGJhvLJHgmiIeBZhAQH2fDe52DXAOk
         fsq5W8jn2h4WrgWVg8kp2CP4ODqi5tLaMFORMuZaJKw4PEmISJaP/XNOh4lf9bUiTwEb
         Lq6VJ41kfZtzUvJrhdt94JPUSn5fnA2NZC+nERarM+luAM1PB9SRCHUkwB43CZSstZ9N
         0S3UH3iHAhwLqrKUljy/pbCfm/AeY6WQuDOWKhjMm+jAJ9yCLEVWwgeXdO3LonnWdd3y
         TTXeAI5XHTw+uTG+3UL3Be1P8QLf0zfHzi11+UXUwbv4McnLSd6gRkWVS8ZBouhuJW1C
         EVCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787023262; x=1787628062;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fmj8lP1yFjzbA+ervTx82nLhcjYdqK4FiTBNDHNyFKc=;
        b=JAeuarh3EvAJ/0UydHxE9i8qOBS7gLtl6xzvpJa/XDkZS/bYWdwYnpOcoQ9nTL+E+f
         S+PE5MXfVu8CVg5n+nK3ysfafPrLy0HRV1yhoYxh/UyV+szk4l4GgaDZV3F0E/5oVIXr
         KYf/Uc9sZJtZAMpMZCZkNglvAOZwiR/P5Ppa9q19p9ygl4C9hYtaYK6QNjgvJKH/1goo
         MFUHyfwKZhNTXsr8HG/isyn70SGZqGtRIEmaVGjWJDWrcNjTWx0knVpCPk7e2xHc3l23
         NTXbduBHazRmQk+KWxK56lcWOgtotNKvDbAdduJ+MW2KQp/MLzpMAbVAuzThFlNnLpN2
         ryjQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr/XIMbebgZV2kjP2HU61tVUgi6XHczQR/cZb4NGEmp1Z7aDDt+UBNFGucdea0i7b6TO/Of29ZhGPWjch/tBA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4iANG83BjjF2l4xcFiu4a5gCVlYOUG5J4SzMKTLzRuj9oj2W9
	OE5CqIE9SzaFPaulTwTrahqlmOuHRGa7HCEru4mhn9HtkQoBSg0PaWt92aMYTYA3qw==
X-Gm-Gg: AR+sD126J7ta+byM1s/vDge7tHAZupXQBCamB0f1T0CxhOu53B+Sb3HxjZPR5T7/N3T
	Aq9qvBFHAT3y5fkn4L9To4j8TIYgOLHCoO7AAtemvrW3wwuDbd2lw08OLmTmdzlRtghofwzCECO
	T9gL4mD+H0ZZY6FoOfcUstVlGs1aJYSSUGmp6mwdyFJQO4OHsccoFZfGuy2Vx4txI0cYxS904u9
	uugq4zbxRTafcvFs78zINEXc5igvaUe6ba/TcgYWIHt8nIH5FwTDj282oXZrQhZ3BiYnNP7Sqy9
	jgal8/IP3m2F5gxSG9+8PvfVQ3p2MMLCDeoH8x8nlDwGa2FzoQL9D6slZBXmofSn0HNK366o7ti
	TXg7ikUNivzPQer6Zv7CX2U7NsigA3uQXd1gjRaJb9NuvJvLHeKCJidEqdaHua42y2UbnIk2a4a
	SRywqbDN9HerVW4eWzrXksKQd9s7v47c8WOP+9UnAnNPUK0hoGOWzwi4k32GusVg==
X-Received: by 2002:a05:6214:2d46:b0:8ff:650d:2b99 with SMTP id 6a1803df08f44-90a91a2bedcmr366357696d6.0.1787023261794;
        Mon, 17 Aug 2026 20:21:01 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::dfd8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c4583a412sm22883076d6.12.2026.08.17.20.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 20:21:00 -0700 (PDT)
Date: Mon, 17 Aug 2026 23:20:58 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: george.0xfff@gmail.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH RFC 1/2] USB: core: add helper to queue device
 re-enumeration
Message-ID: <a22d5d46-084c-4891-9a32-0c9f8adc60c4@rowland.harvard.edu>
References: <20260818-mt7925-rfc-v1-0-284d856ac572@gmail.com>
 <20260818-mt7925-rfc-v1-1-284d856ac572@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818-mt7925-rfc-v1-1-284d856ac572@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_202104_066176_01FEDB0F 
X-CRM114-Status: GOOD (  25.18  )
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

On Tue, Aug 18, 2026 at 04:55:20AM +0200, George Maraveyas via B4 Relay wrote:
> From: George Maraveyas <george.0xfff@gmail.com>
> 
> USB drivers can use usb_queue_reset_device() when they need USB core to
> reset an already enumerated device asynchronously.
> 
> There is currently no driver-facing helper corresponding to
> usb_queue_reset_device() which allows an interface driver to ask USB core
> to remove the current usb_device and enumerate the physical device on the
> port again.
> 
> The difference between the two is that a device reset continues using the
> existing usb_device and its current enumeration state while
> re-enumeration removes the existing usb_device and returns the port to
> the hub code, which then discovers the device again through the normal
> USB enumeration path.

A device reset continues to use the existing usb_device only when a new 
partial enumeration yields the same descriptors as before.  If the 
descriptors have changed significantly then it goes through a logical 
disconnect and re-enumeration, just like the function you want to add.

For this reason it's not clear why you can't just use 
usb_queue_reset_device() here.  From the device's point of view, the two 
approaches do pretty much the same thing.

Alan Stern

> Add usb_queue_reenumerate_device() to provide this facility.
> 
> The helper queues a logical disconnect on the parent hub port.
> hub_port_logical_disconnect() disables the port, records a logical
> connect-change event and queues the hub work.  The hub work later
> disconnects the existing usb_device and, if the physical device remains
> connected, attempts to enumerate it again through the normal hub path.
> 
> Any retries or port recovery required during the subsequent enumeration
> remain the responsibility of the existing hub code.
> 
> usb_remove_device() cannot provide the same behaviour because it also
> marks the port in removed_bits.  The hub connection path does not
> enumerate a device on a port while that bit remains set.
> 
> The helper takes the device lock required by usb_hub_to_struct_hub() and
> holds a runtime-PM reference on the parent hub interface while the
> logical disconnect is queued.
> 
> The helper does not decide when re-enumeration is needed.  That decision
> remains with the calling driver.
> 
> The following MT7925 Bluetooth patch is the first user of the helper.  It
> requests re-enumeration after the controller has already enumerated
> successfully but later fails during Bluetooth setup and cannot be
> recovered by its existing reset path.
> 
> Signed-off-by: George Maraveyas <george.0xfff@gmail.com>

