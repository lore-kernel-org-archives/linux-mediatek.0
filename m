Return-Path: <SRS0=t3QX=MI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B36AC12002
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 17:47:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F4082613F7
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 17:47:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F4082613F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7QcbtL8MmZZyoRWzBvUDbQkLUikE6ExencGmELXvpLQ=; b=o0yHYh328oJwjE
	8Rr9FQeEeXjnmoNbhZtHHf5hkMekJM/lqPWywrzZD9bMsxHdwn1+Vt0qv6yWGYRJtb/kXi5VN+WSe
	BIq4sxYhbE/knF1+6IGXSowZqFDLu3sRbgtpqXAycqbUoVxOk28HhMyUxk6vC0qY2tF7QOg5RCoh0
	t3hfkP+IQATCey5idlosTLMigSGCTkDDPWRgB94zCac9jc+dishtOASq1i772Bgdx0nrsFrkA1qdX
	/eTszfOK3Esg17G6Km6njKi97cwuOeuV6apt8EineRHMeiIqGADC4sqIBWL8cLMLM8sdoQNHut2XH
	g4PWmWO6pVeZBmCgl0dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4Rw5-004zE9-L5; Fri, 16 Jul 2021 17:47:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4Rvs-004zCL-L5; Fri, 16 Jul 2021 17:47:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 50932613FD;
 Fri, 16 Jul 2021 17:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626457648;
 bh=NOjt5NjMa661VMkNCr4Q9Q1BYM1Sz/4T+eB71oGR1zY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=EjAJD26kRH404deCuMRSDKWl+VCMsdEWOKNyoY1giUsSHmPyd3Abi4WPzJks+SIF5
 ixU2IqTQhlClSzB/0B8wjCmR1H/8F7O915NoF8nd6OclmXe3jiHB/XX9kFbTKF7VDi
 uOv9ZLTkryJz2QCfa83YW2soC2BWSWrxTWNDlVWFRXnaFT7DCyhW519qfk8vhy3VQK
 zNC5S98zjZAXp2izgjPH15PfzB6KutUWF+6WoCg6oE9CvSlfMgrGbGU/Nv4wZ2mauy
 rugTbhMHVD/ZunNblmj/DkxjSzNpA5K3E2isqv4/Qtt1xGylEESmKFfmVuER8byhBO
 /5BdzqF8ULSTQ==
Received: by mail-ej1-f54.google.com with SMTP id hc15so16376537ejc.4;
 Fri, 16 Jul 2021 10:47:28 -0700 (PDT)
X-Gm-Message-State: AOAM530YlixeUJN0Q9SpiymOcZi1ZSKWYKvwVrxRexyR9Png4Du6NRxx
 v3WLRvGg+2TXHs+LIEvPTtOzLCCoC7XJsd298A==
X-Google-Smtp-Source: ABdhPJwfIraRxl7lJ9oGZxXg7qn+UIhGE2SLXBe/Q0mxS7GtZlLiFpS5gOX4YT5EKeWzr0D2QFcTruKjVXt8+/Zl8oI=
X-Received: by 2002:a17:906:5fc1:: with SMTP id
 k1mr12803109ejv.360.1626457646957; 
 Fri, 16 Jul 2021 10:47:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210715173750.10852-1-jason-jh.lin@mediatek.com>
 <20210715173750.10852-2-jason-jh.lin@mediatek.com>
In-Reply-To: <20210715173750.10852-2-jason-jh.lin@mediatek.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 16 Jul 2021 11:47:15 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLYtTHdkMrXGv5autnuym1sr+Gqxu5UQxY9LvtOuuKAgA@mail.gmail.com>
Message-ID: <CAL_JsqLYtTHdkMrXGv5autnuym1sr+Gqxu5UQxY9LvtOuuKAgA@mail.gmail.com>
Subject: Re: [PATCH v3 01/12] dt-bindings: mediatek: display: change txt to
 yaml file
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, fshao@google.com, 
 nancy.lin@mediatek.com, singo.chang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_104728_744265_217258B3 
X-CRM114-Status: GOOD (  10.14  )
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

On Thu, Jul 15, 2021 at 11:43 AM jason-jh.lin <jason-jh.lin@mediatek.com> wrote:
>
> Change mediatek,dislpay.txt to mediatek,display.yaml.
>
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  .../display/mediatek/mediatek,disp.txt        | 219 ---------
>  .../display/mediatek/mediatek,disp.yaml       | 434 ++++++++++++++++++
>  2 files changed, 434 insertions(+), 219 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml

Please resend to DT list so that automated checks run and it's in my
review queue.

This is going to need to be split into a schema per block.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
