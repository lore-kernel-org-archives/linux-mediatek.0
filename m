Return-Path: <SRS0=onLQ=J6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFA95C433B4
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 May 2021 16:46:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BF4261040
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 May 2021 16:46:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BF4261040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bkySezOiwHc36PpYKrp/KD+MsDyc9bv31c81ZhfcFsg=; b=A6Mrtsoy6J5FQP6UAesCAPKYB
	FEy96Y7g/PXzTchzg85P5Ofe4pJYyNEHJ6d/TKFR0T5wAkc4T45Ildhb+8imxQwB+rYNmOORZvJAj
	h69DWe0osMaoLwNonjynS0lqMsf8tqAzVoHktAgAkbbz1d5tdzR1OcjD6NetcjNEyno9Y2TSCFGl5
	R70kvLcCZB4mLcpQne1/+a9KxVmDMP+k0aMglR9jNY+2PgiGKn4NCyLfXh+rjJ3xtWu/w4dts+Gr9
	dm9hHBy1fvFoB8UrpBZWDnAUWJsiwy4jUVIdWwIKIJzkKSsYhxF+YzUKkQSDE43spxOe36N6GyIQP
	ybfZkm90w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldbiG-00ER9V-Rc; Mon, 03 May 2021 16:46:29 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldbhx-00ER62-58; Mon, 03 May 2021 16:46:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=di+uDn5ZK8XbVNpFyPQdb4KQZUTMq0eTyzsl560nLCY=; b=Cx84kWPjSerzxGVnmljyUEVhfy
 5AwXSLKyczr6JL2keKf4matpGriYAjLFnE4xbhtmoqchUVXByuQtPf4qA8J4Q1vtINxF2aZNPne/Q
 +5Zwj9pyEdBa8z61FljmDMaQ8cQ98dYgMSMmC+SBzTUSJtE81+JA1+A2GAjVz4XWtwoLlF0zYIvbQ
 lIGZkhWXSYc020sksv018+QVOyMP6DpFTQDsL3mdrapxHdMeH6EQkj7wZ943UxfptjTdXZU+ARmSB
 t6Yk8th/D4loueb2KQKxzKDtaUqRDXjkgCckjBBHIqu0pYVMmqlRUugYbncxtjDLxocrVH+bcmBak
 PcbuDQHw==;
Received: from mail-ot1-f54.google.com ([209.85.210.54])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldbhu-003IC7-EY; Mon, 03 May 2021 16:46:07 +0000
Received: by mail-ot1-f54.google.com with SMTP id
 65-20020a9d03470000b02902808b4aec6dso5646223otv.6; 
 Mon, 03 May 2021 09:46:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=di+uDn5ZK8XbVNpFyPQdb4KQZUTMq0eTyzsl560nLCY=;
 b=eew61Sfzz5sVRcjh4ryRT60C4WZl6cXPRVqY/XeChI8ARu9KbzmndxGSNCSQKQqXyi
 rPh9DowU2bWv3HRa8OeQ9cdRv1IjcvEscsxsktR59rto3uZWu1NhScg4nY81vIrv0dvT
 qoBx/xyk79gbEiyqOtsl2Pb4tvt1ivkExDYu7ldQIMqLY9c8FYYOZlDaabxd+B8Zo4vd
 D5KFJ3aNS09GeQLpRp/U0JjkPXhoT8MgL+4b3pnRuz2HxNu1aBkXrQRJzk4AEQj+92er
 5HSDLc8KZr8K743v1P4X1D9uTDu2WQ74I1Wwq8kD9um3sJW0Qvtjo9MG16vD23dYul5W
 YlSQ==
X-Gm-Message-State: AOAM531Hcb0hsIXYTWbt2b3MHMLWUVmSuciUAACnUwQJOyqY2QBGLXw5
 4RvUOhTtcgwycVmyFjwJTQ==
X-Google-Smtp-Source: ABdhPJzSSVF7sbR4pB4yvtrFsCjmtS5enP7MOLuFCE2RWI0Yh8cdIviLK8gl87cgHpav5XDjUytHbg==
X-Received: by 2002:a9d:1788:: with SMTP id j8mr16508496otj.9.1620060365095;
 Mon, 03 May 2021 09:46:05 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w3sm67710otg.78.2021.05.03.09.46.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 09:46:04 -0700 (PDT)
Received: (nullmailer pid 1985483 invoked by uid 1000);
 Mon, 03 May 2021 16:46:02 -0000
Date: Mon, 3 May 2021 11:46:02 -0500
From: Rob Herring <robh@kernel.org>
To: Zhen Lei <thunder.leizhen@huawei.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 linux-serial <linux-serial@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Lubomir Rintel <lkundrak@v3.sk>
Subject: Re: [PATCH 1/1] dt-bindings: serial: 8250: Remove duplicated
 compatible strings
Message-ID: <20210503164602.GA1985403@robh.at.kernel.org>
References: <20210422090857.583-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210422090857.583-1-thunder.leizhen@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_094606_505345_18CBE541 
X-CRM114-Status: GOOD (  10.32  )
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

On Thu, 22 Apr 2021 17:08:57 +0800, Zhen Lei wrote:
> The compatible strings "mediatek,*" appears two times, remove one of them.
> 
> Fixes: e69f5dc623f9 ("dt-bindings: serial: Convert 8250 to json-schema")
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  Documentation/devicetree/bindings/serial/8250.yaml | 5 -----
>  1 file changed, 5 deletions(-)
> 

Applied, thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
