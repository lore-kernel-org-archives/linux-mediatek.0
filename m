Return-Path: <SRS0=j594=LR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C736C4743C
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 05:30:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38F5E6128C
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 05:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38F5E6128C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oDPrMJe9FopunxmhEIpzwBD9ovbLf1FFhIrYYoCZIh0=; b=FaOytngeDgUv8i
	96EfKmZJ9NJFKtXQUN88kEm7SXevufEHyEYkQXiVVQWH/7H7iNRKENcA+k1kivioqQYfTk7kp09OZ
	F/QKRawO/qyMegDy117PJujLY87rH0FudjOntw04aGNb3hMjbi4mFEPhsrUNKh+4oUwCQv0ME0lE+
	YWDy3H5u21X5gZdDuzgND85/bhmYYh/uTLMH3E2Cf+GSKGXwQDnQS6bsttsPVxTbhSwJzbnH/MHVH
	Z6sM5u3+dzUX0HySbMgeZbjHIbbyU317mV54QRRx8U/ESeEAzF1NPrRX7xbiK3eX/vAET7x+J34WO
	o5y38qJlX1NJwZbGEFCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvvT4-009Poc-Ll; Wed, 23 Jun 2021 05:30:30 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvvSs-009Pn4-LC
 for linux-mediatek@lists.infradead.org; Wed, 23 Jun 2021 05:30:19 +0000
Received: by mail-il1-x12d.google.com with SMTP id u2so1412085ilk.7
 for <linux-mediatek@lists.infradead.org>; Tue, 22 Jun 2021 22:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OkwJfD+9JbK1oq4b62hgbaE6jtrSjfI6D/NEnPdUhSA=;
 b=vBFzqdReY0r/43igR8DEqJFlggZn1MvcSot69Vc50whSaj2Dt4xL0ZorQwwDlw/U7W
 BQNTD2XNDg1RbFSw5ClR8owRgQ6crAWxAEYOnT24zWnnak1VPSOVU6d9DXul6KWsxxXl
 NbTw7RjEhz8MLsUQP74FpAsNhaHiLAzJP7R8C0Rz2tZwGyRxo+3A4lJvb3f1YGApWASS
 9zT1GTiBYqWGXteMzM099F1Uf7OwvhY80MQugeUAvH7EWV3mBTC9ZzH8bB0g9C0sKPuB
 maVzN1J/nTLfs8s0sDC5LM6eIw0bCGfR4FdQlm38RgYM96oNWABZ56gVlsKxq0qxu+Sg
 HjGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OkwJfD+9JbK1oq4b62hgbaE6jtrSjfI6D/NEnPdUhSA=;
 b=lQ1AYgYGgMNH2J0SZRFInV7Q/AvNyU7Y0lUeiGxcnHXpo/BICwragzKkOZDGMYPBlB
 EOw7XJx85I2GRC7igfvqSyscX+dAGX6hh2Xdz2ebML7xalcsCpPYgxWcL/q+y3TGI4W4
 jBKeNQkLZIzD08G4GaGJeartJIpuW5vzhXr//1m8uDHmfykI43rHfcvieqcjcEdrFqFn
 CZMpyD2WVVn9SojTi3PUuP2Bi3xHxZnUvjJxGnYLSezT77ybX+a7r88JgPIQL8d6fKRj
 nnSGGUm9LkG5yGrUAIaEKaOxZtt4NG6GOWLEFSzMMLSXimfZozlLCWnWDJle2BJ9LVxp
 bCYQ==
X-Gm-Message-State: AOAM530zkcXhA1yW5p7/erJxH66O7HqKkjF5BbQsTUyYWNh30ir3KnLp
 F+ax7abhdPd0k4Ja7Wk08pbzGpVh5y1CpU33IPR7Qw==
X-Google-Smtp-Source: ABdhPJxV+0U33TwQlRrhkYebAuOuvvUm2yiD8B+cLmDSJV3xpHJxOwigW3tDHsI7+qrB2LoPw7JRgcwumeLjH3MAehI=
X-Received: by 2002:a05:6e02:1064:: with SMTP id
 q4mr1653159ilj.127.1624426217267; 
 Tue, 22 Jun 2021 22:30:17 -0700 (PDT)
MIME-Version: 1.0
References: <1624271985-23591-1-git-send-email-kewei.xu@mediatek.com>
 <1624271985-23591-2-git-send-email-kewei.xu@mediatek.com>
In-Reply-To: <1624271985-23591-2-git-send-email-kewei.xu@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Wed, 23 Jun 2021 13:30:05 +0800
Message-ID: <CA+Px+wXb-kO7CJP9M6C06YAy6QMaoA0sDe_RO+RMTKT9WoQDkA@mail.gmail.com>
Subject: Re: [PATCH V3 1/3] i2c: mediatek: Add OFFSET_EXT_CONF setting back
To: kewei.xu@mediatek.com
Cc: wsa@the-dreams.de, bbrezillon@kernel.org, matthias.bgg@gmail.com, 
 robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, 
 leilk.liu@mediatek.com, qii.wang@mediatek.com, liguo.zhang@mediatek.com, 
 xinping.qian@mediatek.com, ot_daolong.zhu@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_223018_751589_C4017244 
X-CRM114-Status: UNSURE (   6.56  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jun 21, 2021 at 6:40 PM <kewei.xu@mediatek.com> wrote:
> Fixes: be5ce0e97cc7 ("i2c: mediatek: Add i2c ac-timing adjust support")
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
