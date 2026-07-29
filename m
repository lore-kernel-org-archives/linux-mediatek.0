Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F106DC53200
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2026 05:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7/09h4JafWA6BTqjec/Vv8SutmyeV2+BMV1t1G7T10o=; b=0GsAqEzr/pa/fhf2PBOGoV7OHh
	a10rN+6oBvSTpiQZKDRWVmCYKBWJLPNJw/BJGCdADT+O8oopnNihOHVTfPX0chVa/PfsHzbk6m93H
	Ne8e2QtqzePQlYBNimG+aeoG0Z4Wx3YzCrY+F/YPAiHmtUEuwVnOkMa5EWtSXNTDr05MSesx5+6qf
	pqY/xcwFMjll/9I/5d0OnUU3pxa7KwJlwg6GTwvw8qgZCjdYZ7VagDoXmmC81Avxqte/JlzdXuZJa
	WzzasQppapnhy8OQtSNONU10E4sdoyiIpLrN9OwsP/7KXEoPPMyK1TDLfRpcxplB/RQmorcck+KFC
	g/uvykcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wowUX-00000006uAz-0fE8;
	Wed, 29 Jul 2026 05:06:05 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wowUT-00000006u9v-3zVe
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Jul 2026 05:06:03 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-84a652535dcso370240b3a.3
        for <linux-mediatek@lists.infradead.org>; Tue, 28 Jul 2026 22:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785301560; x=1785906360; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7/09h4JafWA6BTqjec/Vv8SutmyeV2+BMV1t1G7T10o=;
        b=QT9aYGz4b39f137FduNJJSdrPu3qRNQ2Suo1hwmMMvhPBkIoMMgoPTHhfhQi3wMbjB
         DCL28pRr2+5UrGTxwoFKlqQ3BKLF9mc/pmFmmA+AzBf1s+1PXlScA4MgM1aJI0dGTQuu
         LXdEaTM7vY2xO0aaOk/XX2wXM54aEMnkE/OW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785301560; x=1785906360;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7/09h4JafWA6BTqjec/Vv8SutmyeV2+BMV1t1G7T10o=;
        b=FScb5S4tRmDSFhWplL0hv+pli1cC35bsMaGZcKkjgeNQcBOqgS9LFHBKox5a7rVxLH
         L7NIe/1zKS516krI5AoyUpy3VFlBgBmHsQsuivAdHNZqBX+jLSq/LInnnzIUHypdXyiJ
         DPH29JB82y0HI5EwAlbykrJZ3pxYmRiV4aTfZG2EmfLJg+oBJ9y50FW22g5+SB8BgiZ4
         LFIBKmNwY/UVqdSr1Bx6Dt9xEa3PcKWNI2C9cdnMZqEYzQp0aIc5s4rFqpJvJAaNiR1E
         4r/5sdq5yDWjdh3T1yemzB6J52JXP4mVrHAWwd5CITGxOHNYzphunpKGI6OEqQDT+n75
         cRqw==
X-Forwarded-Encrypted: i=1; AHgh+Rq4yoMrqK2AzO9SYImaias3neFjbDR+gjWi2Ix5upTSZVx2/97o9KSvCmxHOlZVtuy775FUrYqeY2Sv1TkXwA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyWhOoqQWOx0vmQkmCrK7Hluws//qcGhEvPnYK3w8ABk2hummHe
	Vr9CpvJk2poRkBwhMulZsO052gmpEXKMZfrKABABTVLKNT7Gkn9sDcg+IcqgzSn3Hw==
X-Gm-Gg: AR+sD132rbLOEN+fhuTWZFPBnquHNSvuv2zU5J3q77DWTKLb7fKKA1C3eMe3sYOrAFE
	q4vBpJMRUZmdgaqSWaMEG0Ua1W2YEGNe2fVajY7LvITgYft1eOkgaV/oMsIJqPlU0g8ardfgmqw
	X3RF6QjZ/MvpG5YZFqJM4tssNTNDchU9HtRaEN1ZeoXT52umCZOcrzkU6NXi0Q9mDPnTAvw2BFy
	p162Nkd+J615wdmsV0mM8xInabW6dAswkKY6p7jXjUgtVf0MtI6BbkRm7BQYX33bedBAO+G7exq
	KZMVWaGU1U9MMY6LyHDlSKwP3Wvhj4Ymdjugk/qb4L9ALCd6stpkxNo6FQs61bWZXmwlIznAxIs
	FUnOvZke3g8wXSpcrHoW0x48o5hU+BkUBOZIXB8fJaNJ2KmHlf7WPkFDh58i7M65KnbM95DQYzP
	dqpRoNGhJjONy25QA+G02ceMofo56fK1nh5SuC3X53FunkXAPXCNl5U/6R/D8GOP9oB2gtDba8t
	TjTvSq8TUID84WHO+fhi2PNKdHhsUjDHZUL3v8=
X-Received: by 2002:a05:6a00:2daa:b0:842:3a3b:d6e7 with SMTP id d2e1a72fcca58-84e931eeeafmr5750213b3a.23.1785301560519;
        Tue, 28 Jul 2026 22:06:00 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:65c1:52a3:f6d3:37dc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea0055dd5sm741877b3a.20.2026.07.28.22.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 22:05:59 -0700 (PDT)
Date: Wed, 29 Jul 2026 14:05:55 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Sean Wang <sean.wang@mediatek.com>
Cc: Tomasz Figa <tfiga@chromium.org>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v4 0/2] Bluetooth: btmtksdio: teardown fixes
Message-ID: <ammKA77-UC1Ie5V3@google.com>
References: <20260618031338.1011410-1-senozhatsky@chromium.org>
 <ajtoXTaBEMSyGADX@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajtoXTaBEMSyGADX@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_220602_211688_49B95631 
X-CRM114-Status: GOOD (  10.34  )
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

On (26/06/24 14:19), Sergey Senozhatsky wrote:
> On (26/06/18 12:13), Sergey Senozhatsky wrote:
> > This fixes several teardown issues:
> > 
> >      INFO: task kworker/u17:0:189 blocked for more than 122 seconds.
> >      __cancel_work_timer+0x3f4/0x460
> >      cancel_work_sync+0x1c/0x2c
> >      btmtksdio_flush+0x2c/0x40
> >      hci_dev_open_sync+0x10c4/0x2190
> >      [..]
> > 
> > close/flush can deadlock when run concurrently with btmtksdio_txrx_work().
> > In addition btmtksdio_txrx_work() re-enables interrupts regardless of
> > close/flush being executed on another CPU.
> > 
> > v3 -> v4:
> > - fix commit message linter warnings/errors (tabs, subject line over 80
> >   chars).
> > 
> > Sergey Senozhatsky (2):
> >   Bluetooth: btmtksdio: test for BUS IO errors in btmtksdio_txrx_work()
> >   Bluetooth: btmtksdio: call cancel_work_sync() out of host lock scope
> 
> Do the patches look good enough to pick up?

Gentle ping.

