Return-Path: <SRS0=OETw=E2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1DDBC5519F
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2020 03:38:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A1DB22253
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2020 03:38:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NHTTU/hE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ceTHKqCR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A1DB22253
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GMtcwW4qsRynX1F6woJnxpCfnKeXA4DW8GpYU/IaeeI=; b=NHTTU/hE6XauqY0NOtF24wabd
	YM7J1zx5bLTyk9Jn5V/aqRqxDl7m/ch+0zYQCKUkcR+dPEGafjFRpopgl2PxvdySnjN3pHc2Jnr9z
	oY3RMACajoer9nIQoNcn2r9tj17um7xwjyLM9/KrKEZzDzVSKgB+rgpf3wMOXxj4LRFq/3Or+rxjj
	VLQFcOjbh5CtjwubpKXJ/80nzqPPnw2v5AKiXDd29PAs5CogHC5LliTWLnb9zqIy54usuxcLwgqqa
	yK48wPBA3OXnh7o7A7bMrxUn/PVT/TF4S5kG6X2t1X5cAnb8WdcEh69NiUd/u3hqE3juUIRc/+AUZ
	tetBXulcQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfxFO-0004HM-FI; Fri, 20 Nov 2020 03:38:06 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfxFM-0004Gk-OQ
 for linux-mediatek@lists.infradead.org; Fri, 20 Nov 2020 03:38:05 +0000
Received: by mail-io1-xd43.google.com with SMTP id i18so8524640ioa.3
 for <linux-mediatek@lists.infradead.org>; Thu, 19 Nov 2020 19:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qjb0TOjLsMDjUodICH7KCcrpDGKufjexd1+8o7B9kb8=;
 b=ceTHKqCRixhp7kONN33MxtSkd783OojNPQR5/0AG/7DDFyEw59YudMfnCY7wgicujN
 M+qkJB0p65VxB5LaBCFKtoxY6vX8sUsueiN04sxxLhRcNO6VWkycNtPbF9ncobZMTWCm
 RjNmoxfTAwHOQ/2H9q9IdOUiGzlOOIecMdv8Su7g0oN1+yjya03FV1hdAJS45zCIM8le
 eEJa1TLZZSAUVuIc9ofmknfotd4V1EdtBsxIHJg2QBnuMJ6UzVwtGrUBJ1LvRX0nhYh4
 7cIvS1a6ET58abJ+N0LkpiHVRf2eNipHohu3wVIzFi2Ji02BXHd508Q9x8hIevmTJlaH
 9qqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qjb0TOjLsMDjUodICH7KCcrpDGKufjexd1+8o7B9kb8=;
 b=PgM7PNv+b1WpCExTL02jlgFR34OJo1jpTZAV1r8NLxCuWsR+cagFQW+lDqvoXYU+om
 N0nthUZ23cCXD+kg0mLbGoqkzUjVp8gC2lDCimj46ui9zDy9grQv4BSc9NToZ6pfBB1o
 j6cPpZX2mbrV9ferWM2D+Cf5VyqE3bpgNTrPT366uG/CTQV6t0VTvWZ/YSgbiRVKvxuj
 Ue8Vq323b7k+86dBdpVwG8tAJBXaPXufq4sr1Lg68bpyCgX3bMyDSDUD1eISJYXnHsU2
 oO4MfdNn8QvcxqabBt+M2UnhEUqxjEMx/coCjWKu2RiQ+GDVDHQzzJ1s5VMOhiE3rGl7
 G6PA==
X-Gm-Message-State: AOAM532COYCWrfOXExYpWymlkLUvr3PIxlIkNBYnlgxpq4UgI15GuKe/
 q34y9siYIa+aw4Q+mlH9lf+RHqLh66unRUjgYU4=
X-Google-Smtp-Source: ABdhPJypsMqrPht3AzlEWEj54WD7QLcxASxpFnXOhG3GU8sv2Ggz+0Z5+J3rw5aatqCoU3Xoo7EEMPQMqRCCPMzXIt0=
X-Received: by 2002:a6b:b3d6:: with SMTP id c205mr8665601iof.68.1605843482923; 
 Thu, 19 Nov 2020 19:38:02 -0800 (PST)
MIME-Version: 1.0
References: <20201119064020.19522-1-dqfext@gmail.com>
 <20201120022540.GD1804098@lunn.ch>
In-Reply-To: <20201120022540.GD1804098@lunn.ch>
From: DENG Qingfang <dqfext@gmail.com>
Date: Fri, 20 Nov 2020 11:37:53 +0800
Message-ID: <CALW65jZzAh7sk-2ASuAj0gM=DGv6g6M7t_SjfSsBWkG=2pk_Og@mail.gmail.com>
Subject: Re: [RFC PATCH net-next] net: dsa: mt7530: support setting ageing time
To: Andrew Lunn <andrew@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_223804_828920_8FE7CC38 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
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
Cc: Landen Chao <Landen.Chao@mediatek.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Frank Wunderlich <frank-w@public-files.de>, netdev <netdev@vger.kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>,
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
 Alex Dewar <alex.dewar90@gmail.com>, Greg Ungerer <gerg@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, Chuanhong Guo <gch981213@gmail.com>,
 Vivien Didelot <vivien.didelot@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Nov 20, 2020 at 10:26 AM Andrew Lunn <andrew@lunn.ch> wrote:
> The bridge code will default to 300 seconds. And after a topology
> change, it sets it to 2 * the forwarding delay, which defaults to 15
> seconds. So maybe you can look for these two values, and use
> pre-computed values?

15 and 300 are not larger than 4096 (AGE_UNIT_MAX + 1) so the exact
match can always be found in the first iteration:

age_count = 0, age_unit = 14, secs = (0 + 1) * (14 + 1) = 15
age_count = 0, age_unit = 299, secs = (0 + 1) * (299 + 1) = 300

>
> You still need to handle other values, the user can configure these.
>
>              Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
