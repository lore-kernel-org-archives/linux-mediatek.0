Return-Path: <SRS0=6pE3=3C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D4AFC33CAD
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jan 2020 13:47:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E3CB20661
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jan 2020 13:47:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H1dQZYBe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="iuAnG+Cu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E3CB20661
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3A1Dofv5Xv11hiJu8Zldh6z+ohlZ5QAWc6I8KlCFaJs=; b=H1dQZYBep07Bah
	uSt/ftPLDbnzmMP1PR5KIcakKVEtm5hfIOk5G0sqN3xcELrD6sdr2hBZGaCIeCeQThszO2yAUBX3T
	xWkMCoSl5AZsO1BopO6mg2ZIvYwaYjPn+KTHhFjFFaR4R7ssmWc2Dw7sQcQMJhWLvalVc4XqXHAvI
	E1nD6N3RjNHJ3yMoGj454/lF2JyyMdO4dBRi2qH44zkOLuE5IWdzotBNW6VGhVtN4ao5Vnoxmk7BH
	qxwbW7w4YVDkx1z0a6VC9k8gWYr6rUbLZzZFAFJef79PGGlQIHAGXZeJ8qv48tgxD+CAIxgFhKVF2
	IJLLynB8tofpG3HPksMQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ir03T-0006ou-Gm; Mon, 13 Jan 2020 13:46:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ir03H-0006eo-B3; Mon, 13 Jan 2020 13:46:46 +0000
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1EB302187F;
 Mon, 13 Jan 2020 13:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578923202;
 bh=AIlrTSnZ1J1BYZeDE/zgmZ4IXahNEVbk9lgMh1AEQ7Y=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=iuAnG+CuflajR1/NGCyzA+4OgWdGpK3JBRoW8i3KxcgXNDqf9Araj+ScJo6ZeOjjT
 ToxoD9QgrlII2z7n3Hm7SMXMKF36MPInnWtwtpDLa2NsPpMtB1H9dT9mt/EKuNq5Z+
 kUI3gsWP6kXyJfteOQcIJNHfn36dpPu35Nr5/ljs=
Received: by mail-qv1-f48.google.com with SMTP id dc14so3972904qvb.9;
 Mon, 13 Jan 2020 05:46:42 -0800 (PST)
X-Gm-Message-State: APjAAAWT7Sg2VcsgTN819vVhkFEKOIQpgZ8UGk9wING5Nyua0y8FkN+C
 e/yhd8vzUJfbfMF2472vZ4yvgdEoIUWUWbgGXw==
X-Google-Smtp-Source: APXvYqyIYYc2t9K2miXG3KyEWH3O5mjcXutnn4DUpikq6B35lTbFFyOCnIJ1ccg69kvCPXEd2zULH+m1JMCJtqyImI8=
X-Received: by 2002:a0c:f6cd:: with SMTP id d13mr15327544qvo.20.1578923201111; 
 Mon, 13 Jan 2020 05:46:41 -0800 (PST)
MIME-Version: 1.0
References: <20191230090419.137141-1-enric.balletbo@collabora.com>
 <20191230090419.137141-2-enric.balletbo@collabora.com>
In-Reply-To: <20191230090419.137141-2-enric.balletbo@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 13 Jan 2020 07:46:29 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLHWa9n167xn+aPFVDvcFLNZpNvWVkrJ15v1WnTtYBLWg@mail.gmail.com>
Message-ID: <CAL_JsqLHWa9n167xn+aPFVDvcFLNZpNvWVkrJ15v1WnTtYBLWg@mail.gmail.com>
Subject: Re: [PATCH v24 1/2] Documentation: bridge: Add documentation for
 ps8640 DT properties
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200113_054643_402596_10D91168 
X-CRM114-Status: UNSURE (   9.86  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ulrich Hecht <uli@fpond.eu>,
 Nicolas Boichat <drinkcat@chromium.org>, Jitao Shi <jitao.shi@mediatek.com>,
 Daniel Vetter <daniel@ffwll.ch>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Dec 30, 2019 at 3:04 AM Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
>
> From: Jitao Shi <jitao.shi@mediatek.com>
>
> Add documentation for DT properties supported by
> ps8640 DSI-eDP converter.
>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Ulrich Hecht <uli@fpond.eu>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> I maintained the ack from Rob Herring and the review from Philipp
> because in essence the only thing I did is migrate to YAML format and
> check that no errors are reported via dtbs_check. Just let me know if
> you're not agree.

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
