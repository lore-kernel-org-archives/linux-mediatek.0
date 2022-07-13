Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5270CC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jul 2022 08:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T33IY03ub9bx2uGB/oh6DbgwyUXDzkzs0s8W3qJ7d74=; b=FNEN8lgdKzMfLd9NR51bsNeSlh
	3ct/keegsFcEN3EHTcUi9V75/ZqRWoxYhEF/vzOCzCaUQKWG7phgxFw96U1l/4fV6AC+RrZzOxpXx
	QZAvu4+fJUSddbE/ErYS8Cjt4+oOBeqTQhYON4epGkePpUGsD4PQNp2DTEF+VWYlxzozypC6AxrE2
	YxQqiunksoeD7U55KPDHHsFRyxh4CdcozMI75nhpaKWSmib2HCo1s08lui2jB43KZHoiPmPQPm92B
	osse+DQwZey5Tp1vzwz+UqtlrAG7lDLrTV5OPtV+8ESQpORMR1ABo6e6OmbQaYVJuX/JGJGVwlmL6
	8PHx79vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBY3Q-001ngc-CY; Wed, 13 Jul 2022 08:49:08 +0000
Received: from mout.kundenserver.de ([217.72.192.73])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBY2u-001n5s-NA; Wed, 13 Jul 2022 08:48:38 +0000
Received: from mail-yw1-f170.google.com ([209.85.128.170]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MEVmm-1oM3Uw10ws-00FxE0; Wed, 13 Jul 2022 10:48:32 +0200
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-31bf3656517so105220657b3.12;
        Wed, 13 Jul 2022 01:48:31 -0700 (PDT)
X-Gm-Message-State: AJIora+S8z+9VrpEE42Nla3OKfU9cKPw0lvu5ka+UhIMh8b86FNSUnWV
	1gCIZFgukLuDsY0aAuF8OD9h/F4kmx8yy+Y6Fd0=
X-Google-Smtp-Source: AGRyM1vMr+hSc6XskeD23TlpGSLGsRTL4NEsYvdeNOBHcA1yUcy1PSuMux1dEngAH38Zd7x/dWUVbgkF4avt9/jahz0=
X-Received: by 2002:a0d:df0f:0:b0:31b:e000:7942 with SMTP id
 i15-20020a0ddf0f000000b0031be0007942mr2817622ywe.320.1657702110838; Wed, 13
 Jul 2022 01:48:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220704025632.235968-1-renzhijie2@huawei.com>
 <CAK8P3a07jGCuAVQAZgpENRP_xFLiogU9W1Uze+n21h7TdOZhog@mail.gmail.com> <df9909dc-3303-808e-575a-47190f636279@huawei.com>
In-Reply-To: <df9909dc-3303-808e-575a-47190f636279@huawei.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 13 Jul 2022 10:48:14 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3SA9zvVu0i1m0kqbemLd4WfTMGfpc8VwhsmJOBgZHvsA@mail.gmail.com>
Message-ID: <CAK8P3a3SA9zvVu0i1m0kqbemLd4WfTMGfpc8VwhsmJOBgZHvsA@mail.gmail.com>
Subject: Re: [PATCH -next] scsi: ufs: ufs-mediatek: Fix build error
To: Ren Zhijie <renzhijie2@huawei.com>
Cc: Arnd Bergmann <arnd@arndb.de>, stanley.chu@mediatek.com, 
	"James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Bart Van Assche <bvanassche@acm.org>, 
	linux-scsi <linux-scsi@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:K7LjAIdYdaTrnMXkpA27vyXNwMAL9d6P7GnaJwq082O8v63MDYi
 kayd/vjERLipQF+0FXVMKbNucPG4GohFyhsvnGCOSwlgVjhlrm5mHAkJJAlkGWHXhwS13Dx
 wJf6V9GjdTbGd2rZswh0IkL5Pkwi8sgqL57FexVNI6PMCvjJn/ERhW+DDmTslFGhzBWTOU4
 LQkhaFdfRVcDHJqFibgTw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:NzAcGoW25wE=:2YHfBqQCxukufZIB0IQpEz
 f3JWCiNfS3iuqKTbee71KQNeNymjN1w2xv54FFQ0vgGwbAw5B9xH1D4ftFu2MxDDGUVAPnwef
 2GJZFaNEK7oQgOFW1TNfCtPySPuPCY3Ef3SDVjpq3wNoj/MvKJd7bO2qkMLAW7lnl4jhWXXvY
 Mha7HL3/vsgEqShBhnKJnTRFAuj92EQuqnqM+ybYdMCx3Xs+9pXXoKhRkmzFFy3Pq9KGEjnnG
 wvQeSaDb7kcYi65M6E3a8/fZYIVqrZPf5JQFzVW9PeNSR+ihyEciSdV0zRSxQ4oFTRVkFc5jB
 c+Z8c5FG4E/MaFta05bhchK2DrHAXnet9OhlLUwCmYckHo1joOrI+kAWa1Y0HLGwYaqGIriQh
 xUtIFSy1DAjsq5Afn/D0r+s2WgwpWfQOGBJYk5F7FcaVvVsjO6NU7WC1hSWuITw5DFSX+7XZn
 5aHSsGSVvYaUSQOfIM1V8JmSVrihVcx5pkbZMBQxs/Bkv20uJlzncWSw4kkoTDopnxeswEYWt
 6llENCGi2tPbpyCUBN14j+bajIPvFVxT4yO70VNvdd1Mv9yXMN65oXJbC6Y9552xRaB7UNaic
 zAKiF/pB0yLwj0n3lAaZLO90Y/E7/OGrdwLf2L0doB9Y8WrOhU+UnpIvQamA2u7hvad7B0SqI
 5pm4jxr8Z0oHCwnsl9anFh5vl//0010pdJeZS8KC7ue7eKP8L8paNKJY/XleJe/OoIX/+5kDv
 ZVJr0nN5YvJurSK4cqRiRTSTR81AV1if2AD5EhCRA0GbmwYsBqcOTyoq7ksOmOEpgHaufi9M2
 EEX4QjBlWfe9Ldw8LNmcLNQg5fJO8KHIZGbc8vY8pSiy48Xa2i49BoCokasWTVJVGu7bx/r0G
 YyDVi9okB4tRP9Qgiz2g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_014837_090215_F380B4E7 
X-CRM114-Status: GOOD (  14.09  )
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

On Wed, Jul 13, 2022 at 3:44 AM Ren Zhijie <renzhijie2@huawei.com> wrote:
> =E5=9C=A8 2022/7/12 16:27, Arnd Bergmann =E5=86=99=E9=81=93:
>
> Thanks for your suggestion.
>
> How does it to fix the implicit-function-declaration error?
>

I missed that part at first. I would say the #ifdef around the
declarations in the
header should be removed here, it serves no purpose, and it is safe to rely
on the compiler to perform dead code elimination so this does not lead to
a link error even if a dead function references another function that is no=
t
reachable.

        Arnd

