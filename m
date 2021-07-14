Return-Path: <SRS0=ob7z=MH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E2EFC12002
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 00:19:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20F8861374
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 00:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20F8861374
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x08/VUwZQ52oRWJ3QWDH3zGzmlES4fpubDe3RslBY6g=; b=iv9oINoaFeBjqu
	/r3G+8zyt6iNtDW8/7f//GLOrsEufpXwhjZovct33iVTJF4ixMCsT3TefAHhQIIBK9TGAJF2IoMJs
	wFwBqPqqL/jc183MXZynkR1Rps7CX5S/BHuSy7ab5gLAJqN0CrBKCmPiPv/XrnqdcE8cKu0fD8NCc
	fSVCqXAdhk92c93gYQBRStwY8/SncUaWPiRkHFfXY+z31Xa+x1LKIo76dswZx5FbBysXGTY/xEG15
	MP0vBQIwIoeaX2JR4pI+N3AuGncE9W/U55tlJG1be7bygX/tY9kMHcTo6gLJd3b9BMk44/E4ds0uL
	f+Kd//sIubkMjXIX4TDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3p6F-00GcX4-2Y; Thu, 15 Jul 2021 00:19:35 +0000
Received: from mail-io1-f50.google.com ([209.85.166.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3o4p-00GBXY-Aa; Wed, 14 Jul 2021 23:14:04 +0000
Received: by mail-io1-f50.google.com with SMTP id z11so4264236iow.0;
 Wed, 14 Jul 2021 16:14:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yctG1YdIV6Px1SU8AGyelV3I04Eay9VEBZw3/gPji0I=;
 b=H+TX8wcIj6O/tmvYhbqrG7Tpr5BMd/Usu5ZIfWbCIQ6bBxkJHbiFMFGxBmbuIYRhuq
 UdACpEcbMbpzJmyhN3/qL7B6x+agrpwt+Uy0WLcC7PIeficj7andBebs6R9Ru5ff+1N5
 edLcGPPadua9AM+fH4sv8dGMtjVgtcK0+DqPsjPI+mIn1OYfwDESAL5VNQVzNFcLaJ+e
 C8YeU9ZMjXLScx7DXhzvvgwpRjYEuzQitFXCAWzeohdrJpo/1nNHRitbSOLjNJFXtiV+
 tFpWkHhplSuXPlEFAlWYeaa17xOUzrn9yOAxT3A87k+lcmkuW1ivJmLcph1WiOnCWETl
 slnA==
X-Gm-Message-State: AOAM533TUXY1Hu9C60gyDCnpcknlFdJi+/bu+Itx7cVJf4vQCj5ldjIP
 E/WprlR1hOTDJyJOxzoZGA==
X-Google-Smtp-Source: ABdhPJwGGiAhes2rUVASRwJcoN46W1Ft9CMHVmWXDoXe7onpUc9CAAeihSmKlq4JbiFGP1n65a40Fg==
X-Received: by 2002:a5e:9917:: with SMTP id t23mr426233ioj.158.1626304442393; 
 Wed, 14 Jul 2021 16:14:02 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id q1sm2119376ioi.42.2021.07.14.16.14.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 16:14:01 -0700 (PDT)
Received: (nullmailer pid 3720101 invoked by uid 1000);
 Wed, 14 Jul 2021 23:13:59 -0000
Date: Wed, 14 Jul 2021 17:13:59 -0600
From: Rob Herring <robh@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Cc: Yunfei Dong <Yunfei.Dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih <tzungbi@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Irui Wang <irui.wang@mediatek.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v1, 04/14] dt-bindings: media: mtk-vcodec: Separate video
 encoder and decoder dt-bindings
Message-ID: <20210714231359.GA3715372@robh.at.kernel.org>
References: <20210707062157.21176-1-yunfei.dong@mediatek.com>
 <20210707062157.21176-5-yunfei.dong@mediatek.com>
 <CA+Px+wWQREny2KSjDfgdnMvk8GKKqr+QvRdSR8YXc1i73wbJSQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+Px+wWQREny2KSjDfgdnMvk8GKKqr+QvRdSR8YXc1i73wbJSQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_161403_437034_8FD7723D 
X-CRM114-Status: GOOD (  13.53  )
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

On Thu, Jul 08, 2021 at 06:04:54PM +0800, Tzung-Bi Shih wrote:
> On Wed, Jul 7, 2021 at 2:22 PM Yunfei Dong <yunfei.dong@mediatek.com> wrote:
> >  .../media/mediatek-vcodec-decoder.txt         | 169 ++++++++++++++++++
> >  .../media/mediatek-vcodec-encoder.txt         |  73 ++++++++
> >  2 files changed, 242 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/mediatek-vcodec-decoder.txt
> >  create mode 100644 Documentation/devicetree/bindings/media/mediatek-vcodec-encoder.txt
> The patch is weird.  Its title says "separate" but the changes are all
> creating new content.
> 
> Would expect the patch to remove content from some files (e.g.
> Documentation/devicetree/bindings/media/mediatek-vcodec.txt) and
> separate into 2 files.

Except h/w doesn't change. Using the component framework is not a reason 
to change bindings.

Also, note that any major changes or additions should be in schema 
format now.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
