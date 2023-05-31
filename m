Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63568C77B7C
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 May 2023 09:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jrtN/2a5JJTprBcYp9jvZ+UGojw4315OmIU8TzujPAw=; b=gQIYOXiqQjSA8rN7B/ayS+Qysd
	3NzbZPObFDguT5Rq0TpIxYk0MRvsEdXrWPoIiQvqqitRbyRtyZg99PSNiPuNorBWjCdMtQtUYIwkG
	1pLgIRWVXf20eidOuCClP62CBCr7eEWIY9jiQebJVs3Re6NClYhGCENmxvY/sRqqpy2OYPJ+04rue
	OJmgSkj2cEt6HxZmnS08/HgbGkGOk38Gw07B+16hcrui8XKEdBHh2+BetV/YJVsFHF6P2PgI9jSYB
	Mr/qDZa+ixM7ibiJU+q4G9qpJ1uYkxFVx/I7tL6aBcNn5uiBPt+40twRcVf+CTsgAGXPZ4OcNsUVC
	YLoe9MJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4HlI-00GoLq-11;
	Wed, 31 May 2023 09:04:56 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4HlF-00GoKm-1K;
	Wed, 31 May 2023 09:04:54 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f4b256a0c9so6152729e87.2;
        Wed, 31 May 2023 02:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685523889; x=1688115889;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jrtN/2a5JJTprBcYp9jvZ+UGojw4315OmIU8TzujPAw=;
        b=aGDLNuG8w9aRbKs613i2qng0wy6XdphgsO9DC+Qy40A8rrPXO9353ZgHVIohfsrRW6
         Y4ZtTXx+79iQm0YUYe89Vqp+5OVVe3+4Xqk2Jgb3dNc5kabutUgM4rsNjvbiuvMk63JL
         QXAnWJByUDNBgRAXdXmQCPcHzH5Q2bEGNspZwLuEFmy+EFcixV895frB3qBUU/ah+BnC
         CV1X5sG+lH4+m283ml9QcxW/0SU6vh1rQZTDqxGbuzfroAyrc33I/Zyg841loN91YQFG
         JmCL4pwEkJfwG2BbIXHG1FbSgpi1tNSY+JAsLI5foOekv+9fsfTF1HndjVO0nfoSUtby
         2JtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685523889; x=1688115889;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jrtN/2a5JJTprBcYp9jvZ+UGojw4315OmIU8TzujPAw=;
        b=FR6nfvZwuuPBhAiT+E4ggCBH0IqVFdpBYDKNIVfTWjD8LL/aExtmNATot/D6TbwsGz
         BISxNMldZOirzHBRgmJ3ll84xQUN3nlXcLPdQTLSt56go8cEM0QGODIvkEGo+n04JtrQ
         k9wNg6Z63FGWRFug8aI3QlyqH1btWS28S20/qLta0NYAKc2eOuXQ769w6d8wY1jCbqdo
         aDmzyzOoSugSzd2oMc30/+w8AehNUrAwJiMtk2o+/X2a3oYj+Rxiz0J2yzaWIf/6ZpZD
         jNyrIRHPI0wIPJWYbnapw60Rw5HstvfpA8yIYZ4N0ZR1DPL+PToNXcwqGGVJGdNFKF7T
         i2AA==
X-Gm-Message-State: AC+VfDwnzNCxa8Eym2kRpCP4eLx85jQeYNbeA0/foYM2esYsEioJZfwQ
	gczk3+jPMyJp24pN3FkSw1QyJAGPSkho5rdP3g==
X-Google-Smtp-Source: ACHHUZ6Q/b1Vd1sDwa9EpiwBHjkXj03DdqC6oi6LN/XlpOtPYWRjn5KHR1hRURuJRJou2lJKUENmn1RoQ1Y2NHNG4DY=
X-Received: by 2002:a2e:9e15:0:b0:2ac:8c95:d42b with SMTP id
 e21-20020a2e9e15000000b002ac8c95d42bmr2183665ljk.4.1685523888771; Wed, 31 May
 2023 02:04:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230531083828.8009-1-ed.tsai@mediatek.com>
In-Reply-To: <20230531083828.8009-1-ed.tsai@mediatek.com>
From: Stanley Chu <chu.stanley@gmail.com>
Date: Wed, 31 May 2023 17:04:36 +0800
Message-ID: <CAGaU9a_Aoyka-tNvG-WGAEacGgcF38gyHLcTLrK+mL_qGfwRwg@mail.gmail.com>
Subject: Re: blk-mq: check on cpu id when there is only one ctx mapping
To: Ed Tsai <ed.tsai@mediatek.com>
Cc: axboe@kernel.dk, kbusch@kernel.org, liusong@linux.alibaba.com, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	wsd_upstream@mediatek.com, peter.wang@mediatek.com, stanley.chu@mediatek.com, 
	powen.kao@mediatek.com, alice.chao@mediatek.com, naomi.chu@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_020453_448321_E15943AC 
X-CRM114-Status: UNSURE (   9.86  )
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

On Wed, May 31, 2023 at 4:49=E2=80=AFPM Ed Tsai <ed.tsai@mediatek.com> wrot=
e:
>
> commit f168420 ("blk-mq: don't redirect completion for hctx withs only
> one ctx mapping") When nvme applies a 1:1 mapping of hctx and ctx, there
> will be no remote request.
>
> But for ufs, the submission and completion queues could be asymmetric.
> (e.g. Multiple SQs share one CQ) Therefore, 1:1 mapping of hctx and
> ctx won't complete request on the submission cpu. In this situation,
> this nr_ctx check could violate the QUEUE_FLAG_SAME_FORCE, as a result,
> check on cpu id when there is only one ctx mapping.
>
> Signed-off-by: Ed Tsai <ed.tsai@mediatek.com>
> Signed-off-by: Po-Wen Kao <powen.kao@mediatek.com>

Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>

