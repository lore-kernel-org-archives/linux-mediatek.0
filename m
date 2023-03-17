Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24547C74A5B
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Mar 2023 19:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b3CQ8WGc4w2GVbQ+AHog+uRw/SumpjFjDyqWJL60hI0=; b=YURkYnde4+fxZDHhzZkoAtXCf0
	BxocOEjTVHfRp0CsGAc4h+0XHfB8VHDvPiV/QdYz3a7bBbd2qzRSV5CPgslNMog7SeWf7o93eEX8M
	p073S6L9gKWcQ5lXWuZaKS39GETHT0a0hXrVpoocvxFN4Ixnij2A4qGhjcDKbdlZfy2xmdjnKgBya
	aOzRuUsmQy/RV4eYYxje3XyN/BoWEJb2uB4TczuAFxkMHQXtny9HXbHZ8QVMbsUQmFUdE9WcHFwIt
	YE5+hS60l4f2p9fmBHM5BUJkHpNTKPCUWFQWbO02rdPy3WEV6iqbhO8c1CFaqTH+nHk4YFdwfSeLL
	A1QX4i9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdG60-003DNn-2e;
	Fri, 17 Mar 2023 19:50:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdG5x-003DMv-32;
	Fri, 17 Mar 2023 19:50:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=b3CQ8WGc4w2GVbQ+AHog+uRw/SumpjFjDyqWJL60hI0=; b=Zd/tq0Qe90m3xsaSdrWry1lWLD
	5phGX+ELK8ssbTAKBBaCCNu5wb08kdauR/gMScZaDhctyqBhovylSqIXxTmXLy+fa79oxG8jSbJjV
	Jsj2JDPGoDy+DktIPKkdPE0LWMmfIJG1VZhBe596iampQcm6cxvHlDGvdjIEtYrYFD6zirIAhO5Mj
	VGRj751XyY0sWICy4VtahGkrXiiYqr6Ekt4yDb9D5vz9J5IO3GNMONo+3JUCaQOTr8TulUSorwHml
	m8sinjr0mB0fpFHMCRwPPmkswpA6Z2UOqDUQ93Y9frX+lw70hIA1UpG8dc9gbGRKXkBJTC8BmVkD4
	AN5pqQ9w==;
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdG5t-002tPB-33;
	Fri, 17 Mar 2023 19:50:31 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id z83so6965961ybb.2;
        Fri, 17 Mar 2023 12:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679082622;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b3CQ8WGc4w2GVbQ+AHog+uRw/SumpjFjDyqWJL60hI0=;
        b=paYhQ9HyuGNRZhcX+W+4wkvn49Zl73wDxF4NFJxzuc1lFNhTty3Zzjl6En/7ixGVcJ
         DRevvNT0lj+toUBebDZYr87DPb4a/y4d82jfNLOrBrl6cPnv7zfpXiJ/VvhEsCw6Pj5L
         O0Nd0MhGXYztpw/BnZUkpdmg/DXvpyTQNNYZRuyDS9hR1kO3SNpYRTX7QUcjqhMXw2Kf
         a6cxw9oC9shZs8YqTn3m+AU1i34IdXxRBvQv0xEsIzG1ec+7z30Nsgmd4Hl8amvp8Hae
         xO20DAhReNI3KkuZ9kBqlSg4gdGPXcu4msryUzBC8G7nZrmdmYMt/K597LuScKXoDv+i
         wSFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679082622;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b3CQ8WGc4w2GVbQ+AHog+uRw/SumpjFjDyqWJL60hI0=;
        b=b89qyi2Ye+ES53EPAMDsyqInPQCtXk32eYb1tMMZqzQxYlMrY777SD16e2ktzGU2UY
         ZjA5ekKMo0V+HpUTmyv0r9cf5+egj7HOKILSMNzOB36NhWdYgz+1XddmIfok6MJ/dmV5
         XG2P7ijbrYD65uIHKFb8Varq6dmSvgOwpXMdCXlfGprk+gB/IpxiCjCNxH24/9o8OjkA
         IkR0rBOUS36g9jBD0SYeFodRaFQfn/6vX/TE1zsM3yXYocFP2aHrLr6xRNwVHK7eJDLR
         mAI2Uo3DcQdG887WrPna+IHmhceUyEPda3exZA/ZB39aXnpNGE6Qd3A0ZXGlUN4G/U1Q
         HbEA==
X-Gm-Message-State: AO0yUKWWPRi9HNclXteB23MLbm05e9OgBsALdwaJFxg2/RpvoEPUYn3u
	CGdjPbboQIn3/w8AOYmh4/bp1CXBnPDN0xeZnA==
X-Google-Smtp-Source: AK7set8TKJGwscidXv9PDMw39S7PyU+VEVKzDYJObGO75JeJd57fC94Asa1qL2/ZU+c85KzeRGGrt/90is3aHzUu/3w=
X-Received: by 2002:a5b:611:0:b0:b67:f07:d180 with SMTP id d17-20020a5b0611000000b00b670f07d180mr235414ybq.5.1679082622364;
 Fri, 17 Mar 2023 12:50:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230123090555.21415-1-git@qrsnap.io>
In-Reply-To: <20230123090555.21415-1-git@qrsnap.io>
From: Nick Morrow <morrownr@gmail.com>
Date: Fri, 17 Mar 2023 14:49:56 -0500
Message-ID: <CAFktD2eFdaCAdE=zxVx05QYWPRcr5StompKr+ehn7piYpQHjzA@mail.gmail.com>
Subject: Re: [PATCH] Added Netgear AXE3000 (A8000) usb_device_id to mt7921u_device_table[]
To: Reese Russell <git@qrsnap.io>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Kalle Valo <kvalo@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Deren Wu <deren.wu@mediatek.com>, 
	YN Chen <YN.Chen@mediatek.com>, Ben Greear <greearb@candelatech.com>, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_195030_098773_5C6FADA9 
X-CRM114-Status: GOOD (  19.41  )
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

> Issue: Though the Netgear AXE3000 (A8000) is based on the mt7921
> chipset because of the unique USB VID:PID combination this device
> does not initialize/register. Thus making it not plug and play.
>
> Fix: Adds support for the Netgear AXE3000 (A8000) based on the Mediatek
> mt7921au chipset. The method of action is adding the USD VID/PID
> pair to the mt7921u_device_table[] array.
>
> Notes: A retail sample of the Netgear AXE3000 (A8000) yeilds the following
> from lsusb D 0846:9060 NetGear, Inc. Wireless_Device. This pair
> 0846:9060 VID:PID has been reported by other users on Github.
>
> Signed-off-by: Reese Russell <git@qrsnap.io>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7921/usb.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/usb.c b/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
> index 5321d20dcdcb..62e9728588f8 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
> @@ -15,6 +15,8 @@
>  static const struct usb_device_id mt7921u_device_table[] = {
>         { USB_DEVICE_AND_INTERFACE_INFO(0x0e8d, 0x7961, 0xff, 0xff, 0xff),
>                 .driver_info = (kernel_ulong_t)MT7921_FIRMWARE_WM },
> +       { USB_DEVICE_AND_INTERFACE_INFO(0x0846, 0x9060, 0xff, 0xff, 0xff),
> +               .driver_info = (kernel_ulong_t)MT7921_FIRMWARE_WM },
>         { },
>  };
>
> --
> 2.37.2


I can confirm this VID/PID needs to go into 6.1 LTS and the current
testing version of the kernel as I am getting an increasing amount of
traffic from users that have purchased the Netgear A8000.

My site is github.com/morrownr/USB-WiFi

Helping Linux users with USB WiFi is what we do.

The OP could have added a comment to the patch showing the adapter
that is causing this patch to be submitted. Maybe he can submit a v2
that can be expedited?

Guidance?

Nick
github.com/morrownr/USB-WiFi

