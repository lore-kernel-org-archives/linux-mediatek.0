Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E69AC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 16:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hujRjx6gCrAsQqlqdC743xUFigJGe2KjY9DYM/HRXvU=; b=eKA4DvQ3v1vFKI
	uDirpNGH4z0f3MJIVGGl0eTKMhsHxs6bYKESjSEf8LKYe7EeEAdgXBOe6yM7fSbJecm1anur3u1n/
	KdqmxWGAqzemFHNCzrMjNSEIKf+cOtsEGZRXMbYGs9rLFV7Vp0xsxAQbC3IpyA7YHrtRnJI8TuOeh
	G3nNOUApttHyxViSlhduKxgHo8CxOj9LNd8p/vSnoTW78r332PY2RKTfY/gQ1vsQL+QL6FXEi67eI
	OPN7onPegrEZ0wOJIHys1MkWMV9XHrDkAVzATZRT8XdYFlJGqa9cdP9X0caq5i3C/cbwPdW5qFd34
	UhGrAGLY/ejFyKsjC0Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRcnc-005EyZ-Ku; Tue, 08 Mar 2022 16:35:00 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRcT6-0059B9-ET; Tue, 08 Mar 2022 16:13:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F2052B81ABA;
 Tue,  8 Mar 2022 16:13:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC7C6C340EF;
 Tue,  8 Mar 2022 16:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646756025;
 bh=jXBz2f9tChtMFtKyOyZ4Q3h2mhlA6Onv+Izw71UufzM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UnxR/RJqQQzmrMWTZA3iu/62twkicgqrZxqPlgt9nko9YFkMPdzqQdhKoUlmtE+sA
 LsIrzYMHxXsjIhdqok6IGMj9Rq+1a6gWFNyB+Z+70KJtOOsqpOWNvFYljWZILzQJFj
 LCxFHq/7Of/gQbIlyvcaL2wihl5o1JEWd4jIsnhVX/JV05yIIeslM8V9wzZWNaplmt
 l79agZVVIiUMcMfcrko3HrLFLt+J5HqqOBuZ0IiRMIWFolhZ93VD/j8oJUDeiczv1Y
 ubHFl6HiKUy6yf1IWu6VGT4SBvF3/AqCtwo8kPFLx0yRK8d3B/jrDwCqPJscQUbEO6
 W1eCuj5HSAGvw==
Received: by mail-ej1-f47.google.com with SMTP id qt6so40326879ejb.11;
 Tue, 08 Mar 2022 08:13:45 -0800 (PST)
X-Gm-Message-State: AOAM5325pZLUZkIo/4AajyFHejyDUZTT0Zw8Q7YV+SwnQJ+uB/2svAIe
 byDgLTM+2hW7uBrxAU7fuVsfn3HG46MY0TWRcg==
X-Google-Smtp-Source: ABdhPJwgjUirqReFAL6N3dmjsf1cllJkmUJ+TfjKooqF93ar8SLKSqqP4oME9QxeInU2UXWZqXn7edss5wrmTCZW8Po=
X-Received: by 2002:a17:906:181a:b0:6d0:ebf5:c064 with SMTP id
 v26-20020a170906181a00b006d0ebf5c064mr13580319eje.82.1646756024055; Tue, 08
 Mar 2022 08:13:44 -0800 (PST)
MIME-Version: 1.0
References: <20220304095458.12409-1-angelogioacchino.delregno@collabora.com>
 <CAAOTY_8CTewRw2Le9RjXoCrqF8AyHD0_p01EMiJ2QQ63yf-HKQ@mail.gmail.com>
In-Reply-To: <CAAOTY_8CTewRw2Le9RjXoCrqF8AyHD0_p01EMiJ2QQ63yf-HKQ@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 8 Mar 2022 10:13:31 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+qqCHvzg8uKx6xaD4cDJJq7hOUvJGME18V7cuLW5OPqQ@mail.gmail.com>
Message-ID: <CAL_Jsq+qqCHvzg8uKx6xaD4cDJJq7hOUvJGME18V7cuLW5OPqQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Fix MediaTek display dt-bindings issues
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 DTML <devicetree@vger.kernel.org>, Jitao Shi <jitao.shi@mediatek.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_081348_663232_93524BDD 
X-CRM114-Status: GOOD (  11.52  )
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

On Fri, Mar 4, 2022 at 5:49 PM Chun-Kuang Hu <chunkuang.hu@kernel.org> wrote:
>
> Hi, Rob:
>
> Would you like to take this series into your tree, or I take this
> series into my tree?

I can't. I don't have the broken commits in my tree.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
