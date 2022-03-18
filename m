Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC3A2C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Mar 2022 14:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/5wXSl5FhTqV8sNydlVu7UEWStcRELpgZwu6DBL+5MY=; b=yRyYajWb0AV7iu
	QK36hZl3nSCSvN9MyoaFykHpSHRfze6a2w90YAz7JAkAEFiaFb1FDE6R1fXnTl1cRfZ7j3OQsnPP9
	wts4ShDA0gPi+y1X7SRaoaL2zqRvGZ4KBnqGEWzUhygJuFSq0PoQWZEZ+m4ugY9gzTz0WpODgnoLm
	bHdhwJomUzZMni+78o8PqyOjEdQMK7OUYhsoN7LB5QLqAe3LDVVCL5zqyTkZyV77aGf4pvF9SDMmv
	fQGC+sqf+souNTjOcaivk/B7n2+IlrfGR8FixnyqZFqzhcEClbkuEqL5D72AGmx8+pzMB80nUY0S+
	aFbx4JixVdSUK9Uk8Rsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVDDR-001pAa-S2; Fri, 18 Mar 2022 14:04:29 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVDD9-001p3O-VA; Fri, 18 Mar 2022 14:04:13 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 9196A1F46079
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647612250;
 bh=YOVEdyrfGs6YY8KU6+URoAWfguVsIhXu0otlSBy1Fos=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kizndKYJmfyPLeA2ieV3Q4kGKXJU2rh4JGfZq6SjPorWANlBeVNlaeLBiWUn93v1P
 H/MDKh29H0lBtD4YBJjCB0lInZmsLH72ZIwUjSaiXLW2QNmjkXxG6nW4Tppa6YmgYe
 y7LgQegeL9LkyM+zSTyCsPn/r/vrIkc8nnIdIkoDpT6ky5GtRJK8q83DQLtORJkDst
 BglkyRU9LgthB+9tV7x1+XqqnEJcmjzVFfqIx8lEARq+VgRXvqbDYzTOfr7lGo7f0O
 rbwUkydtWo3Ke80nNPnrohlJ1ylLQbzU29DhWmgWYmP1NHTAHIHUy9nEX70gPMqbl0
 exAXJ7m5Ol42g==
Message-ID: <aae7c675-6be4-03f1-a8fb-121faae320c2@collabora.com>
Date: Fri, 18 Mar 2022 15:04:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v3, 00/10] Enable two H264 encoder core on MT8195
Content-Language: en-US
To: Irui Wang <irui.wang@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Alexandre Courbot <acourbot@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>,
 Yong Wu <yong.wu@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>,
 Maoguang Meng <maoguang.meng@mediatek.com>,
 Longfei Wang <longfei.wang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Fritz Koenig
 <frkoenig@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220317082230.23622-1-irui.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220317082230.23622-1-irui.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_070412_171481_D4A1532E 
X-CRM114-Status: GOOD (  14.83  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 17/03/22 09:22, Irui Wang ha scritto:
> MT8195 has two H264 encoder cores, they have their own power-domains,
> clocks, interrupts, register base. The two H264 encoder cores can work
> together to achieve higher performance, it's a core mode called
> frame-racing, one core has 4K@30fps performance, two cores can achieve
> 4K@60fps.
> The two encoder core encoding process looks like this:
> 
>      VENC Core0: frm#0....frm#2....frm#4....
>      VENC Core1: ..frm#1....frm#3....frm#5....
> 
> This series of patches are used to enable the two H264 encoder cores,
> encoding process will be changed:
> As-Is: Synchronous
> V4L2_VIDIOC_QBUF#0 --> device_run(triger encoder) --> wait encoder IRQ -->
> encoding done with result --> job_finish
> V4l2_VIDIOC_QBUF#1 --> device_run(triger encoder) --> wait encoder IRQ -->
> encoding done with result --> job_finish
> ...
> 
> To-Be: Asynchronous
> V4L2_VIDIOC_QBUF#0 --> device_run(triger encoder) --> job_finish
> ..V4l2_VIDIOC_QBUF#1 --> device_run(triger encoder) --> job_finish
> (venc core0 may encode done here, done the encoding result to client)
> V4L2_VIDIOC_QBUF#2 --> device_run(triger encoder) --> job_finish.
> 
> There is no "wait encoder IRQ" synchronous call during frame-racing mode
> encoding process, it can full use the two encoder cores to achieve higher
> performance.
> 

Hello Irui,
like v1 and v2, also this version of the series will crash the kernel when
trying to encode.

Before pushing the next series, you shall ensure that it is not crashing
the entire kernel, hence, please test your code with gstreamer.


Please use the following pipeline to test:

gst-launch-1.0 videotestsrc num-buffers=100 ! v4l2h264enc ! queue ! h264parse ! 
qtmux ! filesink location=test.mov


Regards,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
