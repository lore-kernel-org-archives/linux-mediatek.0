Return-Path: <SRS0=Eo9X=NA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0020C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 13:23:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BC9C6101E
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 13:23:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8BC9C6101E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=17AsFnpGRAeMp4sY2OhoodjFn5sW0kiL6in1yxAUoco=; b=dawZbjs/u6yc7r
	TcNTdQgYgL2AdJcekz7sutEFpEeUof9jirNE+2FOy/PJzgWkcuahs+tsHBOUQIxfg1hq+9iiH/jQp
	qPEdFIOQXC8tO2RFE4mzLczFvjFiT/HD6feLUell7MszynjC0ZMcTk0T06Unlo0O0Dqd/Pel9fZ7B
	v7yjIDlPQR7jQzOHgf9ZorhBD55Qo4W1KEmc0NMo4eqzdnyQQ6BlFU3haKp5kpTinldXYUaHMeXcx
	DmBGegwgez/2XBZX2vhW6Ha14pVyCIXjqexuMGCsokBU7+IjfzBz9d5gfXoI58enWCP/vq876M+D8
	dLjTIAUlUnpcxfoMWbUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mD5FN-000lFJ-Op; Mon, 09 Aug 2021 13:23:17 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mD5FA-000lCW-A8
 for linux-mediatek@lists.infradead.org; Mon, 09 Aug 2021 13:23:05 +0000
Received: by mail-io1-xd33.google.com with SMTP id r72so13364639iod.6
 for <linux-mediatek@lists.infradead.org>; Mon, 09 Aug 2021 06:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7uWEeeVIwkabvXFbQSbMB0l+WQ18TEOP0F9KL7oLcV4=;
 b=kzxgoAcHSAEpDOKRfFM3la8JfHcOEpbYpsm1OaTiBfcoUsEe91W0OzdRqWMA6TPyp+
 ORTCXfkz7d8lQkrptq1L5Dp6Dfz7vzA88Xc1+Sgo58ur0YD1eujbSHOKx/FjR4TAc63o
 Z5cTxfC+Qd403XEHK6cN5C43e1+tKlrbG90+vRPZv6rn+Y4834OMBVWrEhGlyuSdjCQw
 Dvv8llksSXErtUvlSZ84sxHF92m49t57YueA6BvDEgbltYinHMm0HsIeFBFuR3q62ir3
 xFWJLCIyQqVe7KagBDr6PfomY7cwH3HDcTpbI+oB+djpt8lYswjBzmSX00FCJDj9S/o/
 QX+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7uWEeeVIwkabvXFbQSbMB0l+WQ18TEOP0F9KL7oLcV4=;
 b=jWlhVyh7Rz45WodSkvGk4qZx7RQZa8pmPUsmoZ/yjWePyaawUXPHNaw0CNW4U67a9u
 g1teR1FfttdCFW/3dqKVadz5U/yD8bmwKaFUkfeL5sytm3t/sMVa6bYPiKEJtDoY5m6M
 cFoM7fO2o2C0Ihuhk4nrDprFB/sSZqMS7cgI4lk4SJHjK2cZBK5HNq+TTMudYkpTK9x1
 l8D2E+HGdsidHJ+U8s4v8YSlMoD2p+9htzNs1XNXx0x9Sggl8jgHYn4vh3OqbqqXqsNz
 YDjDYwg16aYm2QK2g98W48S5hdoL4xJwCkg+WJjbuj8eNJ4LU9VzadT/IMzTS3XLcdcb
 ZFPQ==
X-Gm-Message-State: AOAM532b1h7eajBNE3F8ZxNEJPL6+4T9EDIWfJCYGiHgy3JQiFMKOy1A
 DF62Hp2OsBZZkpbL2mjVkRgD4yys4TqsPdXKuPudVg==
X-Google-Smtp-Source: ABdhPJznaXE5wSq3VvvopznVPm+W64eVM6afsZyEwM9m/WJVw/3fsmA3jvAn2pPJrD6gikPRFd3EXh+MTAFFG8XqKq8=
X-Received: by 2002:a02:cf2e:: with SMTP id s14mr23198526jar.74.1628515380854; 
 Mon, 09 Aug 2021 06:23:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210806041530.4170869-1-tzungbi@google.com>
 <104309d4-0973-cf1f-d61f-731b0642c1cf@xs4all.nl>
In-Reply-To: <104309d4-0973-cf1f-d61f-731b0642c1cf@xs4all.nl>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Mon, 9 Aug 2021 21:22:49 +0800
Message-ID: <CA+Px+wU16dp+g7-kmkT8VcJJ3x8hZv8DxuZiXgt2zzkUMSm_dw@mail.gmail.com>
Subject: Re: [PATCH v7 00/14] media: mtk-vcodec: support for MT8183 decoder
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Yunfei.Dong@mediatek.com, acourbot@chromium.org, tiffany.lin@mediatek.com, 
 andrew-ct.chen@mediatek.com, dafna.hirschfeld@collabora.com, 
 mchehab@kernel.org, linux-media@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210809_062304_405198_1301B2AF 
X-CRM114-Status: GOOD (  10.51  )
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

On Mon, Aug 9, 2021 at 8:31 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> I made a PR for this series, but I would like a follow-up patch that fixes this
> sparse warning:
>
> SPARSE:mtk-vcodec/mtk_vcodec_dec_stateful.c:615:35: warning: symbol 'mtk_vdec_8173_pdata' was not declared. Should it be static?
> SPARSE:mtk-vcodec/mtk_vcodec_dec_stateless.c:346:35: warning: symbol 'mtk_vdec_8183_pdata' was not declared. Should it be static?
>
> mtk_vcodec_dec.h is probably a good header to put the extern declaration.
The follow up fix:
https://patchwork.linuxtv.org/project/linux-media/list/?series=6066

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
