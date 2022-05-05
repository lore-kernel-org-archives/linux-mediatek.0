Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D0DBC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 15:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6aWq5UzQh6IGv56YVN3e36IpNvazv2Zgi4d+dW8EGSI=; b=Qs9jtKWw8DJdJ/
	ryL7sXP1Lb/YfXQNe5Ekk6sIVwCbKZy+w4cQDSLcNjP2xrYKxWe1sYd+TrrTBvcxupgsLU1IusGo3
	cwhcPVjv2s0uwstQp+/2t9z+0IjjCP6sBT0nzh/Z1Z0g0ObokKMpjx956Kftjj78BkEzYYjdCvJXD
	F6CPj/eZhVzznsYIVo7ZGa+DzkB8D0MXQPVB+29AdaCVedXrYkr0wmSRikIXiSv2DPJN5JN/9c8b1
	6yzPUdv4BDZq9Pqi93z9WHQPRM1t0h2akY5Yz3o5LUhPZjffGYg6HJkhmf5zhpp6w9brd5ezQRTxp
	I5Unnaphy1n+wX5n4kyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmdJx-00GdL5-8j; Thu, 05 May 2022 15:23:13 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmdJn-00GdHF-5E
 for linux-mediatek@lists.infradead.org; Thu, 05 May 2022 15:23:04 +0000
Received: by mail-pj1-x1034.google.com with SMTP id
 w17-20020a17090a529100b001db302efed6so4387304pjh.4
 for <linux-mediatek@lists.infradead.org>; Thu, 05 May 2022 08:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=networkplumber-org.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HJq/qvj4FZwE6s96MeqFpqf47Ys+qQjfKC+Vl3h47kk=;
 b=0ZXwdSgZILgbSfTpRkGbOJLVKuFNZdzEMsvyDK9VwGYCP4HAvpLQqNRHaQFb347qjx
 sMhXEbywu0DRM8W+2CmTVBhZiERNFd466mUcCNFBvbbLb0hgAvd4AlPdm2Nrd7zOXoPX
 GDR3wBK5Lwh/pzItEnf7XXi4WfM0GqS0ElL49JvpA+EKoV+e8mRvVOQlhWkWKYrcu+P+
 D8D/diMJGVSskmjPOWEB46Jypy6v9lxrQus7d4p9hc9c0kTFrBl4pa+BE4bOIrKm5DpW
 D9Vz4bytZ/mBDRg/dbwbTK7ZK+vc69do+KtwVbP7CzWumFO6LpcTZdp/ZCY0XSrHe/GA
 d/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HJq/qvj4FZwE6s96MeqFpqf47Ys+qQjfKC+Vl3h47kk=;
 b=1cbLZqrli3DtFs2MGuIIhAUoqeYumvuixoAFpTWPVfHL6dLPXlja+4tUzCWqMlREPE
 qp7mDgTv2JLDqoirxomH6RVktQSyXjxb4oPa+3GOnOLpSN2n4puGm4K4kdK/ECQ2kD7b
 BBA0JH3Q6NIfPg8r7LVt/+t0B8BuyABipy82Iyy9li90iEXKnpOQBPOzwW9RSc7GctJl
 O9b5bTwNuSld0MU5V4aSLB6U3SVZHwaK8qQaaj+/UIfRQcRebrREN5bwKEoMTDEkV7uT
 fKmmKLSsrb7BtthWnQI+a0flmaryZIROOWI+K6uYml7ZiOdxR4gP5BR3s5e5UBgJln17
 skvA==
X-Gm-Message-State: AOAM530GTXNA0ic++KdMUT50WvwNncjJDkN8TtqLKeTBZYAVtKbu1FeT
 SC80dj4uAe2/g7zz5MynUPAaag==
X-Google-Smtp-Source: ABdhPJzxxrHLaaFrj4SdCqEuXu2hYIOTSHOTO75S5Lm125KA7NuKgtEdnmV4IUFHvVLXOo11hjpJ1w==
X-Received: by 2002:a17:903:1d1:b0:15e:9607:d4c9 with SMTP id
 e17-20020a17090301d100b0015e9607d4c9mr24712752plh.41.1651764179686; 
 Thu, 05 May 2022 08:22:59 -0700 (PDT)
Received: from hermes.local (204-195-112-199.wavecable.com. [204.195.112.199])
 by smtp.gmail.com with ESMTPSA id
 i14-20020a62870e000000b0050dc76281ecsm1496229pfe.198.2022.05.05.08.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 08:22:59 -0700 (PDT)
Date: Thu, 5 May 2022 08:22:56 -0700
From: Stephen Hemminger <stephen@networkplumber.org>
To: Gonsolo <gonsolo@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: Suspend/resume error with AWUS036ACM
Message-ID: <20220505082256.72c9ee43@hermes.local>
In-Reply-To: <CANL0fFQRBZiVcEM0OOxkLqiAKf=rFssGetrwN6vWj5SsxX__mA@mail.gmail.com>
References: <CANL0fFQRBZiVcEM0OOxkLqiAKf=rFssGetrwN6vWj5SsxX__mA@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_082303_225832_0CCF12D1 
X-CRM114-Status: GOOD (  10.21  )
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

On Thu, 5 May 2022 08:29:52 +0200
Gonsolo <gonsolo@gmail.com> wrote:

> Hi all.
> 
> After a resume I get the following error:
> 
>  +0,000007] UBSAN: invalid-load in
> /build/linux-lowlatency-fSdu7c/linux-lowlatency-5.15.0/net/mac80211/status.c:1164:21
> [  +0,000004] load of value 255 is not a valid value for type '_Bool'
> [  +0,000004] CPU: 22 PID: 387 Comm: kworker/u256:5 Tainted: P
>   OE     5.15.0-27-lowlatency #28-Ubuntu
> [  +0,000004] Hardware name: To Be Filled By O.E.M. To Be Filled By
> O.E.M./X399 Phantom Gaming 6, BIOS P1.31 01/14/2021
> [  +0,000003] Workqueue: phy0 mt76x02_mac_work [mt76x02_lib]
> [  +0,000014] Call Trace:
> [  +0,000003]  <TASK>
> [  +0,000003]  show_stack+0x52/0x58
> [  +0,000006]  dump_stack_lvl+0x4a/0x5f
> [  +0,000007]  dump_stack+0x10/0x12
> [  +0,000003]  ubsan_epilogue+0x9/0x45
> [  +0,000002]  __ubsan_handle_load_invalid_value.cold+0x44/0x49
> [  +0,000004]  ieee80211_tx_status_ext.cold+0x4e/0x5f [mac80211]
> [  +0,000068]  mt76_tx_status_unlock+0x111/0x160 [mt76]
> [  +0,000010]  mt76_tx_status_check+0x68/0x90 [mt76]
> [  +0,000009]  mt76x02_mac_work+0x14b/0x240 [mt76x02_lib]
> [  +0,000008]  process_one_work+0x222/0x3f0
> [  +0,000006]  worker_thread+0x50/0x3f0
> [  +0,000004]  ? process_one_work+0x3f0/0x3f0
> [  +0,000004]  kthread+0x13b/0x160
> [  +0,000003]  ? set_kthread_struct+0x50/0x50
> [  +0,000004]  ret_from_fork+0x22/0x30
> [  +0,000006]  </TASK>
> [  +0,000001] ================================================================================
> 
> This is a stock Ubuntu Jammy lowlatency kernel (with Nvidia drivers).

Contact Ubuntu.  The rule for upstream is if you load out of tree drivers
than that kernel is unsupported.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
