Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD454C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 May 2022 14:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FqoPZgggatgD9IsECC4UO5TB1H4ThHU1dtXjZAdgpPU=; b=1p7cIqdkHGpjYj
	VTUbxFcOK8xs3z/mu2FLZp9HRV+ZAjUYrDYryU+jlEbw9LGaIaBYjaWVywmwiOpnpnMIj5UZJwXBe
	Fu+NI7W5/tujojBteTcswVZbxi43AOjk1tZHGtzhb/ic471Rz5epXhSlY6dqCOUd/+GtmlKofUGBn
	KPWgm7SnQz9uFBnIUaYU+L148ci7biqnMKPanCR9CssG4cnrjpNOy/nic41IB1q5r/z/PxbV658PT
	LKj8nF99LcjRViR6hsmIGYHQuproLiPcfWzuaGbqygDvqAOCRjOgp4BvbTZVEIjjFVjnqS6aD+/Vz
	l+ZJNtkcziAH4f8YT/Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnLZe-007QEO-P8; Sat, 07 May 2022 14:38:22 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnLZT-007QAx-5p; Sat, 07 May 2022 14:38:12 +0000
Received: by mail-oi1-x234.google.com with SMTP id r1so10635237oie.4;
 Sat, 07 May 2022 07:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nJOPPb18Oo0+/K8yxoE5qod8LtCarDUSMpTNksvDWi4=;
 b=GVV1i2BDnyYYHDVrrTnPogQxFlVZ9SsU5k0irmRzJYyV9F+pJr9Vf2QfJib/h0rqD1
 hqd8mkYqj1CuqHbmTeuDqcGbW+7p2f7tPKvLEHFMmaahz7UndB78VgyC8tb1HCT1Vh5H
 qR7mcqcxtfWiiLv7rC6wNzgzWx8Mn8oA/HLs66h4RISTdErs2Lv/1bOYAPbXn485Zq4K
 t+bipdYo041zCBNNhZarjT3sYpKGgRtHFnesTcz8/Ak1reKr7Tah5KxyYI51kH5gVCmv
 eh2/6rRud9GVjxtubgqW7Ya4zsh7DTRI0ujv39JzSBsmqW2h/eGF56VAY+zAag1Q44kL
 qlIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nJOPPb18Oo0+/K8yxoE5qod8LtCarDUSMpTNksvDWi4=;
 b=Et/bnQrTaJW/TAcqGFZ3GzrRi+t13Ai7Wr5h1t9k7ON/4ve0m2i/SDqiWu6NjbBvch
 8tAvKh9Lq3l/GM0oD8LVYnHgwZMJuJVepKGO52cfE9YEs330THJ6IdEZHpRVPP1SLgVD
 i5gNZfpGQqlXK3VOX09vjKvagXBB4veKm+uFo33aa31+8uOlKhUy3F5/FV9Qaouj5RoF
 jeqhdn9SDBwwL8uFSpxwaT6k7V6Wmun50xfj0O82UyDM2s99e2DxKrOsh1Ou9gYF0Lsa
 zlqgBWKoWm/TS0MgtvLZGZs66D/hw/hFsy7bVFcwmhpAZxLjLNKnvqyHfx13sSEbIZxO
 MVZA==
X-Gm-Message-State: AOAM5325TdpTHFc8hn2ShrXyEhm9r7AwbPjPUFucoRNwPl9LxeAdHHUd
 cU4KQSvXTBUNgS5eAddVk3WjyDNdU++h9Qx/9rI=
X-Google-Smtp-Source: ABdhPJxz2rDTHCIEhTyFmyrx8ADw8gfmFf8WPj575Q5NKkjoOnYOtow2/B+cPd6ER9LiwFlNn74HdnAL+hPDmO21C70=
X-Received: by 2002:a05:6808:11c3:b0:2f9:62e0:ebe with SMTP id
 p3-20020a05680811c300b002f962e00ebemr3805925oiv.22.1651934289041; Sat, 07 May
 2022 07:38:09 -0700 (PDT)
MIME-Version: 1.0
References: <CANL0fFQRBZiVcEM0OOxkLqiAKf=rFssGetrwN6vWj5SsxX__mA@mail.gmail.com>
 <20220505082256.72c9ee43@hermes.local>
In-Reply-To: <20220505082256.72c9ee43@hermes.local>
From: Gonsolo <gonsolo@gmail.com>
Date: Sat, 7 May 2022 16:37:58 +0200
Message-ID: <CANL0fFSmqR4F=9bFgVRaKXyCDocwwhxySUBo5x=12900fhWn6A@mail.gmail.com>
Subject: Re: Suspend/resume error with AWUS036ACM
To: Stephen Hemminger <stephen@networkplumber.org>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Kalle Valo <kvalo@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, linux-wireless@vger.kernel.org, 
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220507_073811_280028_941B8663 
X-CRM114-Status: UNSURE (   8.65  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Dear Stephen,

> Contact Ubuntu.  The rule for upstream is if you load out of tree drivers
> than that kernel is unsupported.

I compiled a stock 5.17.5 kernel from git.kernel.org, installed
without kernel headers (forcing dkms to not build proprietary drivers)
and get the following errors *at boot time* (not suspend/resume):

  +0,000386] wlx00c0cab022a0: associate with 8c:6a:8d:9e:2a:88 (try 1/3)
[  +0,001118] ================================================================================
[  +0,000005] UBSAN: invalid-load in net/mac80211/status.c:1164:21
[  +0,000004] load of value 255 is not a valid value for type '_Bool'
[  +0,000003] CPU: 10 PID: 380 Comm: kworker/u256:5 Not tainted 5.17.5 #3
[  +0,000004] Hardware name: To Be Filled By O.E.M. To Be Filled By
O.E.M./X399 Phantom Gaming 6, BIOS P1.31 01/14/2021
[  +0,000003] Workqueue: mt76 mt76u_tx_status_data [mt76_usb]
[  +0,000009] Call Trace:
[  +0,000002]  <TASK>
[  +0,000003]  dump_stack_lvl+0x4c/0x63
[  +0,000009]  dump_stack+0x10/0x12
[  +0,000004]  ubsan_epilogue+0x9/0x45
[  +0,000003]  __ubsan_handle_load_invalid_value.cold+0x44/0x49
[  +0,000004]  ieee80211_tx_status_ext.cold+0x1e/0xb8 [mac80211]
[  +0,000058]  ? __radix_tree_delete+0x91/0x100
[  +0,000006]  mt76_tx_status_unlock+0x119/0x170 [mt76]
[  +0,000011]  mt76x02_send_tx_status+0x1af/0x420 [mt76x02_lib]
[  +0,000009]  mt76x02_tx_status_data+0x47/0x70 [mt76x02_lib]
[  +0,000007]  mt76u_tx_status_data+0x67/0xc0 [mt76_usb]
[  +0,000005]  process_one_work+0x21f/0x3f0
[  +0,000005]  worker_thread+0x50/0x3d0
[  +0,000004]  ? rescuer_thread+0x390/0x390
[  +0,000003]  kthread+0xee/0x120
[  +0,000003]  ? kthread_complete_and_exit+0x20/0x20
[  +0,000004]  ret_from_fork+0x22/0x30
[  +0,000005]  </TASK>
[  +0,000001] ================================================================================
[  +0,003098] wlx00c0cab022a0: RX AssocResp from 8c:6a:8d:9e:2a:88
(capab=0x1411 status=0 aid=16)

I sent the first email because I suspected that the above (locking?)
problem was totally unrelated to the GPU driver.
I hope that this is more helpful.

-- 
g

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
