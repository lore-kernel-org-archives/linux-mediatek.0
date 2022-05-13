Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3946FC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 12:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A+oU6+DUzv0AempwM2dV+CThVzv+GdUeZiJh+xp5ybU=; b=jgbpUo5LX+ub6m
	QRl+JMU005+1H5YkuaQC8DZISPh1MidZc3JT5B2R73//I1qsUmkM156XQQ7GTY3LvuKSK+bme9V59
	2nd+bTAAgVUVZt7DMmy9DS9QADGxpEtRCq3cLiRyOZp8O2dHYndKlpGui53kopOPJ/J0nWVpr0rhW
	q4NtFq/vJZy0LSmxT2cey4ejKq/N69jXdnjwff51La4mzMRseH6pk0QnNv5sIx/ttEjotyyC/s3lg
	YRm8RNHS117waCP5suxghgCTi4UqL7/ybIw59uwuzymM4t5MoYGdjBOslYJfCjIKCr3cNWmFEKuO7
	DGrQu7om9Xj8FG1VWaxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npU9m-00Fx9M-Ad; Fri, 13 May 2022 12:12:30 +0000
Received: from mout.kundenserver.de ([212.227.126.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npU9a-00Fx55-5O; Fri, 13 May 2022 12:12:19 +0000
Received: from mail-yb1-f173.google.com ([209.85.219.173]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MXGSU-1nGoXg3zdm-00YhPN; Fri, 13 May 2022 14:12:15 +0200
Received: by mail-yb1-f173.google.com with SMTP id y76so15014138ybe.1;
 Fri, 13 May 2022 05:12:14 -0700 (PDT)
X-Gm-Message-State: AOAM532/lz+igJEf06Ww2e6Wb3gumUhS9MIPL7p52Ry7LZeLLG2ID9Te
 O7DpVafmYjgF/DBJC1PAlGMZLC4gxbWJXlAeeVM=
X-Google-Smtp-Source: ABdhPJxfSXlHQiGp7nrwso72I/95P47eTph2XTKWx941GNdu4mVPGKCRC9whxXixu0RskwZlxcjV+W7Q9bXxryN7UkU=
X-Received: by 2002:a25:31c2:0:b0:641:660f:230f with SMTP id
 x185-20020a2531c2000000b00641660f230fmr4509779ybx.472.1652443933446; Fri, 13
 May 2022 05:12:13 -0700 (PDT)
MIME-Version: 1.0
References: <b4383f23-0adc-b9de-a1d9-abd1c2f82b27@gmail.com>
In-Reply-To: <b4383f23-0adc-b9de-a1d9-abd1c2f82b27@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 13 May 2022 14:11:57 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0iFq3X6PrLggc=Av9GdWnJU=US659jaUXqH+X4GnbYTA@mail.gmail.com>
Message-ID: <CAK8P3a0iFq3X6PrLggc=Av9GdWnJU=US659jaUXqH+X4GnbYTA@mail.gmail.com>
Subject: Re: [GIT PULL] arm: mediatek: DT updates for v5.19
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Yong Wu <yong.wu@mediatek.com>
X-Provags-ID: V03:K1:jYi8MElG/U3RQ1+iv7gyNNxd72GWq5Tw1dpSuzSFMEIyJBtLuyi
 JneUvf3wM5Yc/ZEBrlC7efnsQVhNe8amIHPlhOO00Cj+jrACVjDSXH3r6qG30mBjiV850Em
 +1L3MnunuYko5z1duspGjS+SSvyp1aEIF2xN7KMdDR5coGRufvn54kRTW6S1pC0JWN1BLbz
 YbMo56fTFdvw6yGiphhow==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2AV5i9Lgso0=:CyQLP/rtuh3daqRjJgTsOc
 M0W6+Y8qJVTiUQA5EX87KXiTPndvS+bNiMmYquoRfG5BMHObYLWiA7upyUurAlBWF3IMscYVc
 0za9TS3XSlllwXOPIncs10AS4sypN8cuC7fMfyOoSU7k1Ko71S20YyTzKgLEmK7+pIzVDSf2R
 lp8wVh0GCUQ+yaZ0bdW3D5iFT0q4wxCEfRKZ/IdL+pyRrp+g7xjy4aGBsXxGzOSsGrnSL9hiK
 od/zfOnXhvWRW6EqkBTax59sCy/E3VkzxjPhN8hstPGfQivLyVctlTeyDm7OGBbrBWXD4pYLi
 ml7IQCRIIsnenY8Qa0CQf94vTZwLv89koMZNJNyMTEH7dD5cYSzX0AoLU+2vvoynsUC+pXcJy
 wEV85GsCMr0LUWv4SoZQVUXG7IgMtkb7TY8eK7Z0E+hXAFKpWMvTqGJqH2Ao9mlwTMtZ11QUs
 p/2ooszviTotopJe29xBbUxLnlKR+v6xW5pP588Yb2T22ewPluh9aj3cq4k+PKXnPV0a99MZW
 rmI4hot3mOATP5sZSsqoVsM2OCimY7ceCvwcuX8SfHajoBZWWDplQ2XjW1S4qv3ptioWW8sah
 2hmVBW5KaN6d0EtYAR+eC5AZlMRiXW1xRnMLDYxna9rCmaRnqMObqgp96aHFgBpsGz/Y//pii
 Kby57vkDJWDqwkFDB3cK2evFj5f5VW5UhvqZF/J9nJFVeakXBpzRtevol8LXUKqQENPB2MBz0
 ZbI5sgpuFv1Ov3QgQy53e2n57R4ZC9J5LI+zlcT2hbje2bQy2CexbCHeZWpzdkwDykxC2LX0f
 kPE3h67LDUoqsSzEkhbXLxPp17MQjZvynkAFDoYxqSBDnsi/DE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_051218_545572_FC2FB6D0 
X-CRM114-Status: GOOD (  13.82  )
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

On Fri, May 13, 2022 at 1:21 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
> Hi Arnd and Olof,
>
> Please have a look on the below 32 bit DT updates for v5.19. Apologies for the
> late pull request but I got sick and needed my time to recover.

> Yong Wu (1):
>        arm: dts: mediatek: Get rid of mediatek, larb for MM nodes

Can you clarify what this means for backwards compatibility? I see old kernels
used to parse these properties, does that mean that the updated DT is no
longer compatible with them?

If you break compatibility, this should only be done for exceptional reasons,
and explain the tradeoffs. What is the oldest kernel that is still compatible
with the updated DT files, and why can't we just keep the properties around?

       Arnd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
