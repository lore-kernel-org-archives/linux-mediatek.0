Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1583FCAC582
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Sep 2025 17:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SN3v4BDj6IFxe4p49D0eWcikdp1MC+MbA48ZuP9sTU8=; b=Of1rfAYUyF2tyvCLlx5CLP+ded
	xDaX/o0Wk7xztJfbIyBpimgPhjqU6IQUyfr0TSTRVJPpmfJr0NJssTIkfNC+L8WbyoMc1VPbhpsre
	53sL6AqBVNfW9pCRLD2SuoJ5IBdzHqPWP8xIov8rSUKYfeHyq6FJ3Y7/kyLoubETTUyRhPVoegbO4
	rmDJjNnD8xJ60YrNUsYk6Do51npXLc20WlXngb1tGguSa58u7c0nqDA32SnKdEJSgmBDi+IHHeXYl
	g47qic41SPMhmyZj9pBwZdsoz0PBh2FVLiaZi+ElkdpTmkr5xFLycWM9nN8Kpni/x8x60V3r1icjp
	/BwtIJdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1vL-00000008mxs-3XWz;
	Tue, 09 Sep 2025 17:14:31 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwwF-00000006tmc-0JmI
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Sep 2025 11:55:08 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=HdVQZPT1MOoq9Iy41Z4qJXtIUrvjtKu3enIoFGQe9cijQ+b7uEwYmjDDe0j2h87QqvRxCgfSsE7IRH53eYkgWCdW4Kv3A1EXouRpLy+jcEuHFjIbUoSLdRTO61XcSsXlLOUauIL1WQAV83m3XRXc+FkGXo7/wYNp3ZTj1qEH3ZlQHqk+O5z+zAmoNHbBBf/xmf3AIYzknK5903N2QOfKXS+Sr7zoraiW0SvxldlcpylWYXPJk3eelJH4iQeAXJoImfohO65Fm+sMnSurXQbAJmRTYxdUdHseo0p8sQ8HyU9OwKOK48zrYdDyZj3Jyj9/K1fYg4p0AHWLs3dzzwqqVg==; s=purelymail2; d=purelymail.com; v=1; bh=SN3v4BDj6IFxe4p49D0eWcikdp1MC+MbA48ZuP9sTU8=; h=Feedback-ID:Received:Date:Subject:From:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-mediatek@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -713498179;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Tue, 09 Sep 2025 11:54:38 +0000 (UTC)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Sep 2025 13:54:36 +0200
Message-Id: <DCO8ZY43WXEG.1EK23QDRO0X6C@mentallysanemainliners.org>
Cc: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 3/4] pinctrl: mediatek: Add debounce times for MT6878
From: "Igor Belwon" <igor.belwon@mentallysanemainliners.org>
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Igor Belwon" <igor.belwon@mentallysanemainliners.org>, "Linus Walleij"
 <linus.walleij@linaro.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, "Sean Wang"
 <sean.wang@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250908-mt6878-pinctrl-support-v1-0-3fb78c8ab4e8@mentallysanemainliners.org> <20250908-mt6878-pinctrl-support-v1-3-3fb78c8ab4e8@mentallysanemainliners.org> <493794af-a1e8-4a4e-a253-2b6b703df53b@collabora.com>
In-Reply-To: <493794af-a1e8-4a4e-a253-2b6b703df53b@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_045507_186271_B40E4AED 
X-CRM114-Status: UNSURE (   6.76  )
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

On Tue Sep 9, 2025 at 10:00 AM CEST, AngeloGioacchino Del Regno wrote:
> Il 08/09/25 21:17, Igor Belwon ha scritto:
>> MT6878 uses different debounce times than other SoCs. Add them to the
>> EINT driver.
>
> The only reason why I can't give you a R-b for this is that you forgot to=
 add
> your S-o-b...
>
> Cheers,
> Angelo
>

My apologies (again).
I was rebasing these changes and rewording them a bunch, probably got
lost somewhere there. I wonder why b4 didn't scream at me.
Will add.

Thanks,
Igor

