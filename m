Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC599C77B7C
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 May 2023 03:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FIKWTzsbM0dwoaRf64Qu10v5SQhI6q6nuz1uBIsxu94=; b=zEKCpZKeOPDQ/lGWsW1RF/2pzL
	tv86uYxVqxmGbzmyD3QwEEZ3/p+VQ4sQDbvJq7+ASRGmhz2l2gY95Sl2Bp7B3hGM0CSbLtQKlU902
	xxuqIEth0trN5/pIsaKD5BWbRSlx8yk6G0c+N1kIJV0QCSGTxIFrlytEUZ3iTpiQu7CvbmT7NmApg
	8hl6u61XSS3PPRxmNdx/UCwArL/R0rhvNttB9+UoWhBVM3KvKsT+mZDVDFn0PYikc7tqfiyW/Vqbx
	aFWJpJwVbEE7KSLEPXeE0lFRst/S6LcthbcjxBVZXnrsPVlkgFhnczlJChs+FrPy83JJrXsRFLEsD
	bR9/+D8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxJDP-00Angj-37;
	Fri, 12 May 2023 03:13:07 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxJDN-00Anfr-2h
	for linux-mediatek@lists.infradead.org;
	Fri, 12 May 2023 03:13:06 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-3f396606ab0so953001cf.0
        for <linux-mediatek@lists.infradead.org>; Thu, 11 May 2023 20:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683861184; x=1686453184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FIKWTzsbM0dwoaRf64Qu10v5SQhI6q6nuz1uBIsxu94=;
        b=CZiD6dnpXR2oAYhbHpac52YmOtECTL4PrcNlsQXTrgF2GDZzm8ANvYs2rrcpnVd3NV
         5z155HJ/0J06Rei5Cf24HZgOJQYR6st+Tg1/rMoCN4i2+BZeVq1Y7pEj5VJ9Keb1K+Jb
         JHqBKu+QYZ+lC2QrR3oXhm1Gs4phbHkQ2uAX/3530rGSvZ2N4WX7jIEO6pzd79AS+GlZ
         YGeFF/5kyzighKa3ub7MoxKNuec5DobCIwtfDpN/TM0vhhEFvHvFFd1pkkK9WpFpKcD1
         BrRcFZjc/9CUwz4nDXOMezdK3klAbanNXIlr4FMbmXBwrWnJ9baD20PVsxdzkuaJTlCz
         MlWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683861184; x=1686453184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FIKWTzsbM0dwoaRf64Qu10v5SQhI6q6nuz1uBIsxu94=;
        b=VawbpMGCiyzR7SgXA0MMTg7W35KjlRHHHP26UGNxZt4WhLqM1ICrbktX9BVLOMAOUu
         s/Yp6bz7fSLqU7n2UiGDUZOIPS25Ki469LFWimbcrwITcKEFbFKsAm5VzyEARM/CsQkf
         YMCslG1JlL8cKb7mlBQqzuo0SSIxFrLc8nrGMkikmXCAmjwVL8lOUHGxwDhYMKbZJ2VJ
         YtZ//3q2qQjLLm1drVIdtqoq9tB6uPFK11RQlgv8rwqgRpFsS9T+4jYgLUuA5dRzoXS2
         h4I6CUKmLv7uPp4zAKnzgicevya/K4BVTNHxV/NIWuiiAhG/OCLiU7Eu/ohgnRIQihIr
         7uSQ==
X-Gm-Message-State: AC+VfDygVuaIWgBBYV3Fk6p5w/9kdQxX0wl/02UtNpsj2pGJzFP7s+xa
	nVnVzPT02EeDnyjPjjvQtPvKN6Qvx1CeMF0ADgNO
X-Google-Smtp-Source: ACHHUZ4JnfrZvOycBzMaW0OjiWrBkQofMMdUE1fG68T2dtRqy4yEJncjgOz87BFIaeD5CkHPdJD1YirX5jVhbZddbYY=
X-Received: by 2002:a05:622a:1812:b0:3ef:1c85:5b5e with SMTP id
 t18-20020a05622a181200b003ef1c855b5emr99445qtc.19.1683861184189; Thu, 11 May
 2023 20:13:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230419074910.10809-1-walter.chang@mediatek.com> <20230419074910.10809-2-walter.chang@mediatek.com>
In-Reply-To: <20230419074910.10809-2-walter.chang@mediatek.com>
From: John Stultz <jstultz@google.com>
Date: Thu, 11 May 2023 20:12:52 -0700
Message-ID: <CANDhNCoNXO7phZj4zjpMWCA2OsK3EgTUenUuX0z-KAejgqu1Dg@mail.gmail.com>
Subject: Re: [PATCH linux-next v3 1/4] time/sched_clock: Export sched_clock_register()
To: walter.chang@mediatek.com
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"Maciej W . Rozycki" <macro@orcam.me.uk>, wsd_upstream@mediatek.com, stanley.chu@mediatek.com, 
	Chun-hung.Wu@mediatek.com, Freddy.Hsin@mediatek.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_201305_879621_DDF464EA 
X-CRM114-Status: UNSURE (   9.93  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Apr 19, 2023 at 12:49=E2=80=AFAM <walter.chang@mediatek.com> wrote:
>
> From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
>
> clocksource driver may use sched_clock_register()
> to resigter itself as a sched_clock source.
> Export it to support building such driver
> as module, like timer-mediatek.c
>
> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>

Sorry for the late reply, I was traveling when I got your mail.

Thanks for your iterations on this series.
I'm ok with these, assuming the folks who maintain the timer-mediatek
driver don't have any more objections.

So for the first three patches:
Acked-by: John Stultz <jstultz@google.com>

thanks
-john

