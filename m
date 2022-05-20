Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E61FC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 11:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Cc:To
	:Subject:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9sFtDS+BzlaTNsXv4oal+Ow5XjZIaGUPB0EolMcJqqM=; b=exI+wQqnVtHeDGLTEiu/dbMwKu
	wmXpuiPjuE/9JgWh48IZnTjYX3sR7Icwn/6q4yMEzMNRTXuFio23/b6r6Pdl//e4XmrgBmktHAiWd
	0HcRF9ey1RFcBwoz4md6mhQbR1JOJd0YqIxFCUKyq8i8iqRLdHnoip00YE2wtzOJmpKHna5iXyBKf
	471706kExtDtvp7pKrpkYgOz87K3np+29HD21aBhwYsvYq2nizKH5fQcSLgQXZRP7fzyl+q4/tVyr
	Zu9WBsEM9TlfysgEpIifu4TLPsnHJGpDNUXmJf15xvP+bIa57gXZa8nrEib0V0ZODiaNUJtSoCW6q
	Gvlxuq1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns0O1-00Bx4W-08; Fri, 20 May 2022 11:01:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrzJN-00Bi6D-04; Fri, 20 May 2022 09:52:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Cc:To:Subject:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=+Q0QiA7ru6i8BsA9kJw7SZPGcwHJrhsZ4QvZNcEI9Dg=; b=lusa4XabNN/DJKc/s0wsxB2JBj
 I33KcD8q1wzZSVXPvkx9162/UvWnna0yJiCE/RcejlaveRfclwnaj0CfB45I8Kknp3awxgJyNqqMH
 kbQKlu9XMQ8BU4DB7PwQS1dvD5Khz047O3Yz9e4x/LFr92hILuFHeNNlpiqVDkzn6MbngQ/Pm7snG
 xdjR7tyHGULXpvPI+zedRp3Xo8jGfgwGUyaiXHa2/q8QMilt9f3Lr6qxObBpw33DG5QspJBCUEmp6
 N5uGYwfgfSNhAA6HdRd4iLW880voFLsc1fwEjdaxF/w1/vT34JtOzbrMPXGr/iD1vL3GvSzaiBwcD
 V1SRBGVg==;
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrz8r-002IAv-7U; Fri, 20 May 2022 09:41:56 +0000
Received: by mail-ej1-x62d.google.com with SMTP id n10so14578391ejk.5;
 Fri, 20 May 2022 02:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:message-id:in-reply-to:references
 :mime-version; bh=+Q0QiA7ru6i8BsA9kJw7SZPGcwHJrhsZ4QvZNcEI9Dg=;
 b=qx0h4A1phm5nsIroUsJwfajaIeD7n912JaN0mRC5EAn8j78j6xSyKlsylTXxCMZuKu
 eJvfLlqevQHJrDbbh7RkFrgnPLbVyOxA6T9kGy/6LI16CeXYpHply9dWKVG9qsadXonh
 oan7RSXE4Ywm7kwFwLR7qTXKKepqKeKLatdAyrw8LsA0D3fkmQoEcENyBFUc0pgNnUzv
 TUhQ/gF8jQ2uG8pFukE4tFlIdVmD2EMpRZTmNRVm5JXZTwwTbDOJSagsWkk/d9WtHaaD
 AlY40bQ44f2z94SYbbgiGUKxRMvQI2lfY23GPi27X4wixARlyi6KppYRTutH5kuyy17j
 w/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:message-id:in-reply-to
 :references:mime-version;
 bh=+Q0QiA7ru6i8BsA9kJw7SZPGcwHJrhsZ4QvZNcEI9Dg=;
 b=ED2KNzSQPtJ76GQHaVm3M6GQspgbEhPIUsnQdj1vSr7688kgWoqJG5sLrycUTLvN0f
 KqXf73NBLcMBoklyynO2FU+23fbXtUIyV0+A6D6GPgFcXFQtrFCQsPAj/bqUdDWsqNUc
 dNnmQbBB4cFBdjJ4NgyCohueGVTSEcIaxckrdeY23h33I6sO783G9ssvt1dU5wz2CiMc
 9zJ9c95FVsT+WE5B3SC8xzoMKXqOtgCBRaB+q6MosWNjuX5FaFyWZb70qTiQwGFPt+Ya
 XPQAhC/lRrDV26k7TmFbdc4KXANDrTxmD+EWi3AyWGLMi80dyGO1TuxIgBN/VEsugc5W
 8+ew==
X-Gm-Message-State: AOAM5321eaK3FuzNHIlu61GXCZYN7ZHEV7kQCrddVUQpU373pakF7M+G
 4hEsCVX1yaOhyCUdibGUUIg=
X-Google-Smtp-Source: ABdhPJx8KoctJFPDI79r21gvLJwl+tekVa1UwU2OiLxDKk1gsbX922JsgN+mWcLDYdoCB7xhEaRD/A==
X-Received: by 2002:a17:906:1f52:b0:6f4:ebc2:da82 with SMTP id
 d18-20020a1709061f5200b006f4ebc2da82mr8207315ejk.176.1653039705676; 
 Fri, 20 May 2022 02:41:45 -0700 (PDT)
Received: from [192.168.151.247] ([138.199.7.159])
 by smtp.gmail.com with ESMTPSA id
 z22-20020a170906435600b006f4c4330c49sm2937723ejm.57.2022.05.20.02.41.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 02:41:45 -0700 (PDT)
Date: Fri, 20 May 2022 13:41:33 +0400
From: Yassine Oudjana <yassine.oudjana@gmail.com>
Subject: Re: [PATCH 3/6] clk: mediatek: reset: Return reset data pointer on
 register
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Yassine Oudjana <y.oudjana@protonmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Miles Chen <miles.chen@mediatek.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 =?iso-8859-1?q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Message-Id: <9LD6CR.FM55IKDYS0IC2@gmail.com>
In-Reply-To: <5b5f6656-8694-dc78-ef42-7ce301849aa4@collabora.com>
References: <20220519134728.456643-1-y.oudjana@protonmail.com>
 <20220519134728.456643-4-y.oudjana@protonmail.com>
 <5b5f6656-8694-dc78-ef42-7ce301849aa4@collabora.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_104153_834092_ACA75DF0 
X-CRM114-Status: GOOD (  27.20  )
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


On Fri, May 20 2022 at 10:42:40 +0200, AngeloGioacchino Del Regno 
<angelogioacchino.delregno@collabora.com> wrote:
> Il 19/05/22 15:47, Yassine Oudjana ha scritto:
>> From: Yassine Oudjana <y.oudjana@protonmail.com>
>> 
>> Return a struct mtk_clk_rst_data * when registering a reset
>> controller in preparation for adding an unregister helper
>> that will take it as an argument. Make the necessary changes
>> in drivers that do not currently discard the return value
>> of register functions.
>> 
>> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Hello Yassine,
> 
> Thanks for your efforts on helping to make the MediaTek clocks better 
> - I agree
> (and I'm not the only one..) that there's a lot of work to do on this 
> side.
> 
> Though... I don't think that this is the right direction: you're 
> right about
> properly unregistering (in patch 4/6) the reset controllers on 
> rmmod/failure
> but I'm not sure that this kind of noise brings any benefit.
> 
> Explaining:
> You definitely saw that there's a new register _with_dev, which uses 
> devm ops
> and that's going to automatically cleanup in case of removal/failure.
> This is what we should do.
> 
> Hence, my proposal is to drop patch 3/6, 4/6, 5/6 and (slowly, 
> steadily) migrate
> all of the MediaTek clocks from CLK_OF_DECLARE() to platform drivers 
> (which also
> means that we can eventually change them to tristate!), so that we 
> slowly remove
> all users of all functions that are not "_with_dev", and that we 
> finally remove
> all of these then-unused functions as well.

I've tried to make small (but hopefully not too small) steps with
little improvements. Originally in MT6735 clock drivers v1, I only
added reset controller unregister, and while rebasing on Rex-BC's
reset cleanup series I found mtk_clk_simple_probe/remove while
looking for references to mtk_register_reset_controller, so
I thought of using it for my drivers resulting in this series
adding support for the extra 4 clock types. I started finding
other things that could be improved such as the other clock types
not having register_*_with_dev(), but I had to avoid adding
anything else since that would only make me find more things to
improve and this series would've never been finished and sent.

With that said, if these patches could become an obstacle for
later more complete reworks, then by all means drop them.

> 
> Making sure that I don't get misunderstood:
>      I'm not implying that this huge migration work is on your 
> shoulders!
> 

Of course. I would never be able to handle such a large task.
Everyone currently helping with modernizing this common clock
framework has my full respect. You are doing amazing work.

Thanks,
Yassine




_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
