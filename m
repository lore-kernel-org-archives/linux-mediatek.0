Return-Path: <SRS0=SQT7=KJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D76AC43460
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 May 2021 03:25:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 938046143E
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 May 2021 03:25:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 938046143E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YAoQa3y/b2Zz8iYzPFfsBMeD857eVAPyov1a/2YTpPE=; b=PoyP/g/OsOYa4A1Prc5N2wlj5
	Is2uztk3peIKPB17PhfGgCDzb4jTJGWknX52hBY7D6GpQdr9m/dUSXsSEyZ77tI+PI1do/V1natm4
	rJ/LFAMmWn79H3DHw44U/dRttXF+cBA7G//G5mikVQo+cpkyR+d71rCtgc1VIWReV2scBw2/4QyZz
	aRawpR20NIDpOjc8d8zKgwL/1Vr3UIDVZOq71fCxLrbTSmVN/8jmTKU795B0NptHcLlU6mKfX/GCn
	9C0BzFUcrQrMZAmxDVVmkSo87npmJkgnBex2WoWRClSaARy6GNF+6iEa3ozmxcsNLZ9Tw1f2wb09h
	JzOqhb1QA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhOS3-0073m7-NA; Fri, 14 May 2021 03:25:23 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhORq-0073ig-36
 for linux-mediatek@desiato.infradead.org; Fri, 14 May 2021 03:25:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=qA/LAFFI+jVcP+Kd0M4qGoF8L0ZjvsmsYJZogOYbiAQ=; b=R9cf3PeHq+s3QHM9V/8uqqc9zD
 npsNTtoJwbWavetwOHj0I+HB3cPwA4dygpF3NI1MzgGAtTQWwqlRjvNgQLrXSmEa1+I7NM2UpMp57
 76bj32RF/MXzmRPHXO0RYYgtKEErz8aQnnt13IR/PHz8HtsAkaaW6UTi5BRcZgpiojcgeHFF/PH/r
 lAOBykNIKX9mm4mVvnMkJrXTArlXAXOwHeN8rs4a3upKXeTEh7adOoXt1S5+YeEns8tn3QzmGpWYM
 vy+HMwwKQ+lHsM9jDfe9b3SMpVbxmutgYHIDTpyMnqskeYm4DeL9feHAls1my4LZj27sUByCbDRZB
 KuL2Kb9w==;
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhORn-00BgSz-Fn
 for linux-mediatek@lists.infradead.org; Fri, 14 May 2021 03:25:08 +0000
Received: by mail-wr1-x42f.google.com with SMTP id s8so28719696wrw.10
 for <linux-mediatek@lists.infradead.org>; Thu, 13 May 2021 20:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qA/LAFFI+jVcP+Kd0M4qGoF8L0ZjvsmsYJZogOYbiAQ=;
 b=OnjxILPnJeDvRHc9iPEEubFRbiphS8lU5ZgLeRSWr2HzrlP1DuFvVPXhIZfEaZD3gf
 5JA73EIhyl1v6HW8kqMIKaP6pkA7VlsoyV2CZmFIyWQWYiKIxKCFOO3ZKEXwB36LeEaQ
 riU5cxJaoeJ4t7799NBgL/dTh0MWFAVv+t/Q9yiUEtLXTqwwb/Zni9QPUMIqx98cSq9L
 SyVojf4YpB8dBjYSqGZ5HVyYgnjPjkFkAFzNpF3wrPaK85t6QZhJHXDSyfZGrDk1g0za
 9BMqc+dD4M4u4W2xRxiP/eV3iVh2POo1G1J56faFWeqwAYxVAFDx+fWiiy8rZqjnXCS+
 6Z5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qA/LAFFI+jVcP+Kd0M4qGoF8L0ZjvsmsYJZogOYbiAQ=;
 b=YcrVp8lA55nL4uc4k2yr6nio2R09lVZQ6s2SVnl3gsER5Qm37EBu/3W7qTAQeEYL+J
 Q4ltrlDpAHjFZFrsoLxGUcVkS+ncXWbOB6esMfl9gRYuxmLaprpyfJVqRlbCWwK9jFjj
 2NEExaQg35jI2AJ4t4fi5+am3StDHlKJ05bjJuhNvMb2JusyeC+MxQI60/f1WVwCSJVK
 2uE0KmKBzjmllBG/uTBGfw6s6DPI25DovM+yQIbprXtb4j57QoJVDsYcPMSsxWCKQ82O
 2sOoGNSATTlt/YrzKpKfN+hvdN+4Lj4EZ4lJNasjczI7/7xlqhlBrN14+BNCVVpGpKTg
 2C5w==
X-Gm-Message-State: AOAM530dpk3u74SG2ZvkyCUtTV0Ygb2neF9+6QxmMaSLoYP2PkRrpA99
 av23y5GYSzTkteJRHnllVSXqe+Nc7ntoe2htcoZ8Qw==
X-Google-Smtp-Source: ABdhPJysEt9Tqu0H8JHhPzilEzabOOJJAWxjXOF//mN/UtdUlgdJyJW3QAPMpr1mk0VY8Ri9ETrEsbEKKeJISz8db9w=
X-Received: by 2002:a5d:40c4:: with SMTP id b4mr56971603wrq.307.1620962705236; 
 Thu, 13 May 2021 20:25:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210504054612.3585017-1-hsinyi@chromium.org>
 <20210504054612.3585017-2-hsinyi@chromium.org>
 <20210506203124.GA753747@robh.at.kernel.org>
 <a573e490-44bd-d6a1-d0c0-075b6541f720@gmail.com>
In-Reply-To: <a573e490-44bd-d6a1-d0c0-075b6541f720@gmail.com>
From: Jassi Brar <jaswinder.singh@linaro.org>
Date: Thu, 13 May 2021 22:24:54 -0500
Message-ID: <CAJe_Zhcz3yPcyxHMtAYTY+wKAzWxt2LJsj-AU7QFneW8MTv1HQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] dt-bindings: mediatek: Add optional mediatek,
 gce-events property
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Devicetree List <devicetree@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel@lists.infradead.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 linux-mediatek@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210513_202507_534661_DEFA5180 
X-CRM114-Status: GOOD (  14.16  )
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

On Wed, 12 May 2021 at 10:55, Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
> Hi Jassi,
>
> On 06/05/2021 22:31, Rob Herring wrote:
> > On Tue, 04 May 2021 13:46:12 +0800, Hsin-Yi Wang wrote:
> >> This property is used by gce clients.
> >>
> >> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> >> ---
> >> v2->v3: move definition to Documentation/devicetree/bindings/mailbox/mtk-gce.txt
> >> ---
> >>  .../devicetree/bindings/mailbox/mtk-gce.txt       | 15 +++++++++++++++
> >>  1 file changed, 15 insertions(+)
> >>
> >
> > Acked-by: Rob Herring <robh@kernel.org>
> >
>
> Will you take this through your branch, or do you prefer me taking it through mine?
>
I see I was not CC'ed on the patch. So I can't.

-j

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
