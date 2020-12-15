Return-Path: <SRS0=7Zfj=FT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24898C4361B
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Dec 2020 00:09:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0641221EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Dec 2020 00:09:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0641221EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hBKdRhOPkkww52LSDCSdO1EivBEMMEscXht/TpcKaLw=; b=tTpa3k0YN/TiNDKy0Q1ZR8Nxd
	I9AV89F6gGBXiY04JXWFFVxVAif/+U3HK6A34wvv7ly78JbgoOtg0C4LoEu3Viq7RpY+g+Jllfj1N
	eG6tU0GbKE41RJf+NgJMDOThubMWGlD8ct8CjrioKF+4Ci/W4T7xFQMhGZ/4Acs1zc4e2OwWG9W97
	l2YhvYTrHrHtyRv0S+UJs5QqKo+F7FCzeDIbb5OJTFJKq08A5Z8XiIZgrhqeezyUTkXH5BzfyRVNi
	rr3bGhp3dh407Hcwis6zoPxxGVijv9GUHSJfGx1BBQ7VhjDq5MCDi71aNxLr7rcdeXEofbSjL8V5N
	47HGdoZhQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1koxtl-0007t0-12; Tue, 15 Dec 2020 00:09:01 +0000
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1koxtj-0007sR-2V
 for linux-mediatek@lists.infradead.org; Tue, 15 Dec 2020 00:09:00 +0000
Received: by mail-vk1-xa34.google.com with SMTP id l187so4367888vki.6
 for <linux-mediatek@lists.infradead.org>; Mon, 14 Dec 2020 16:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2ttijJTfODj0Zw+PUd0CH6vbnNY+xpMxFmKzapopdOo=;
 b=LhdygB6+PBVsoDGFWC8aF15Je+KPpnI6r+Rt5Sz9g43Zpp0Xs2L2fC5GSgzqBlXg+S
 vq8JK7fV829mSoDKbXrHdXTSi+nic/z16m6KRLSEFk2bRFeBQhdFzKNApWYzUoMj6rBt
 rMViZEL6bvs9tRj0RLKx90ABvNFCjAPqS7G0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2ttijJTfODj0Zw+PUd0CH6vbnNY+xpMxFmKzapopdOo=;
 b=sNxxDN2lJ9JaBGl/DzW5WmSyM3nCHf1AbBD+xrH/QvnBbJN94KBW/zLwAh+EplexYk
 oiSlXFjw8ZNkOn+wvScT5ajUWGV+O3LuSpnd8R3zTwEY4vKG0VVrBeLbEeDLl8/4Hl/g
 YVRDsGABvis5WBz7YLnONv12hdAqqnpDLHzP2mHR517FMv2hTu7mafSiD5KwlPK3o+Dq
 X6RioFQ3QEHD86bwCU9oIQWisJ1sGp878HjgVmSgKww84Ymu5fhhRc++UQbu40Jnqz2h
 4rkv4q8TjDv+XhJ5VtQOUPTOswiwOYYUK8eN+nfpMrcUj2SdUi53k0RLUJHU9B5CUUFz
 +WtQ==
X-Gm-Message-State: AOAM530YUSDEyCZY77gr4Kuueg8tD8bH9Od9WbBtALO9XGGSxTtaFUdM
 L/UIIzi+sbXUlu6jrt6Jc6A7Do1RJFhbEnZ7K8usDQ==
X-Google-Smtp-Source: ABdhPJy/1hO7y7P77oLAkHG/yrijX8RVfCX/zuNWqZhUuTxFWOz7zvfhphWSajaxWShotI0auCTiSWY1pyVLaO3pj/I=
X-Received: by 2002:ac5:c5b5:: with SMTP id f21mr26908136vkl.13.1607990935654; 
 Mon, 14 Dec 2020 16:08:55 -0800 (PST)
MIME-Version: 1.0
References: <4f0b3800cd92e1a45a1a47598174e3ff8e944204.1607949735.git.objelf@gmail.com>
In-Reply-To: <4f0b3800cd92e1a45a1a47598174e3ff8e944204.1607949735.git.objelf@gmail.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Tue, 15 Dec 2020 08:08:44 +0800
Message-ID: <CANMq1KAgYKBXGPMgpMpAF=6rWv3zVsHBBjwX1fOCRC2THCYM5Q@mail.gmail.com>
Subject: Re: [PATCH -next v2] mt76: mt7921: introduce mt7921e support
To: Sean Wang <sean.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201214_190859_185252_69324368 
X-CRM114-Status: GOOD (  17.66  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Ryder Lee <ryder.lee@mediatek.com>, robin.chiu@mediatek.com,
 ch.yeh@mediatek.com, Eric.Liang@mediatek.com,
 "open list:NETWORKING DRIVERS \(WIRELESS\)" <linux-wireless@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, YN.Chen@mediatek.com,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 lorenzo.bianconi@redhat.com, Lorenzo Bianconi <lorenzo@kernel.org>,
 Soul.Huang@mediatek.com, nbd@nbd.name
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Dec 14, 2020 at 8:56 PM <sean.wang@mediatek.com> wrote:
>
> From: Sean Wang <sean.wang@mediatek.com>
>
> Introduce support for mt7921e 802.11ax (Wi-Fi 6) 2x2:2SS chipset.
>
> Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Co-developed-by: Soul Huang <Soul.Huang@mediatek.com>
> Signed-off-by: Soul Huang <Soul.Huang@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
> v2:
>  - Mark the patch as -next
> ---
>  drivers/net/wireless/mediatek/mt76/Kconfig    |    1 +
>  drivers/net/wireless/mediatek/mt76/Makefile   |    1 +
>  .../net/wireless/mediatek/mt76/mt7921/Kconfig |   10 +
>  .../wireless/mediatek/mt76/mt7921/Makefile    |    6 +
>  .../wireless/mediatek/mt76/mt7921/debugfs.c   |  180 ++
>  .../net/wireless/mediatek/mt76/mt7921/dma.c   |  356 +++
>  .../wireless/mediatek/mt76/mt7921/eeprom.c    |  247 ++
>  .../wireless/mediatek/mt76/mt7921/eeprom.h    |  126 +
>  .../net/wireless/mediatek/mt76/mt7921/init.c  |  482 +++
>  .../net/wireless/mediatek/mt76/mt7921/mac.c   | 1387 +++++++++
>  .../net/wireless/mediatek/mt76/mt7921/mac.h   |  367 +++
>  .../net/wireless/mediatek/mt76/mt7921/main.c  |  854 ++++++
>  .../net/wireless/mediatek/mt76/mt7921/mcu.c   | 2588 +++++++++++++++++
>  .../net/wireless/mediatek/mt76/mt7921/mcu.h   |  991 +++++++
>  .../wireless/mediatek/mt76/mt7921/mt7921.h    |  379 +++
>  .../net/wireless/mediatek/mt76/mt7921/pci.c   |  209 ++
>  .../net/wireless/mediatek/mt76/mt7921/regs.h  |  455 +++
>  17 files changed, 8639 insertions(+)

I'm not likely to review this, but, this is a _huge_ patch, is there a
way to split it in easier to digest parts?

[snip]

> +static void
> +mt7921_mcu_debug_msg_event(struct mt7921_dev *dev, struct sk_buff *skb)
> +{
> +       struct mt7921_mcu_rxd *rxd = (struct mt7921_mcu_rxd *)skb->data;
> +       struct debug_msg {
> +               __le16 id;
> +               u8 type;
> +               u8 flag;
> +               __le32 value;
> +               __le16 len;
> +               u8 content[512];
> +       } __packed * debug_msg;
> +       u16 cur_len;
> +       int i;
> +
> +       skb_pull(skb, sizeof(*rxd));
> +       debug_msg = (struct debug_msg *)skb->data;
> +
> +       cur_len = min_t(u16, le16_to_cpu(debug_msg->len), 512);
> +
> +       if (debug_msg->type == 0x3) {
> +               for (i = 0 ; i < cur_len; i++)
> +                       if (!debug_msg->content[i])
> +                               debug_msg->content[i] = ' ';
> +
> +               trace_printk("%s", debug_msg->content);

Please do not use trace_printk in production code [1,2], it is only
meant for debug use. Consider using trace events, or dev_dbg.

[1] https://elixir.bootlin.com/linux/v5.8/source/kernel/trace/trace.c#L3158
[2] https://elixir.bootlin.com/linux/v5.8/source/include/linux/kernel.h#L766

> +       }
> +}
> +

> --
> 2.25.1
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
