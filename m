Return-Path: <SRS0=aF3H=7R=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DF05C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jun 2020 09:08:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1722A2075B
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jun 2020 09:08:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="odTqXsnC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qDGdaABw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1722A2075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JJXt+mQIxAkZDpvZB92AioYbAE5UvJIF79vV/H4mW0o=; b=odTqXsnCQr1sDH
	OXA+e03QFMYWjbFmqGgZD+xicGpsiEb8CG02x15Ci8FAxwhB1f2imHJ4yZCTj1Dk6u+YT3kc4W1CO
	oiFzahEUKLHP3pZR9/Rbx73negAWdkasMu7DAd5ad9AV9x3srarac2SGV9n8CoLEyMiBLq0OjntCr
	1CPdKqpmLa8hdRMcdM2M+aksWVLlK7G9nZKuGnUMvh/lnxKXADnYaWc7xYTYbxrBAZmF/hLHru2XO
	hJ4trwTO+EjNK5i8eMvZeEkeplrW3tbWA5HVquoaTZpYcRW3PVPO5zw5okl2Z7mUuxYmCMToi8WmV
	fYb8Jsl7kSOGjZTE6wZg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jglr9-0006qz-VD; Thu, 04 Jun 2020 09:08:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jglr5-0006pQ-MY; Thu, 04 Jun 2020 09:08:10 +0000
X-UUID: 0d2763b65e96487ab203f8ee114907a1-20200604
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=vNTRRvj2mI0CwYUwHIUwitX832SWdGrxETBfN5PZOa0=; 
 b=qDGdaABw02nWs5Lsv5ac7HkkwZMad4aVr8CSkfUa15SX0ziglfzj2yGwc4W/SOTwL1wgz0QPN5t+XlY3jK0UoW8Obvyt2XNTfgHw1cEtlTJ0uEBwXE6RPxSHB7kHPc46p2ut5RInUAjayGEjnVIDGmIG4DDcOoKnyKP/pfOgWDc=;
X-UUID: 0d2763b65e96487ab203f8ee114907a1-20200604
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <xia.jiang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1572099063; Thu, 04 Jun 2020 01:07:56 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Jun 2020 02:08:01 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Jun 2020 17:07:59 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 4 Jun 2020 17:07:58 +0800
From: Xia Jiang <xia.jiang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab+samsung@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Rick Chang <rick.chang@mediatek.com>
Subject: [PATCH RESEND v9 00/18] Add support for mt2701 JPEG ENC support
Date: Thu, 4 Jun 2020 17:05:35 +0800
Message-ID: <20200604090553.10861-2-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200604090553.10861-1-xia.jiang@mediatek.com>
References: <20200604090553.10861-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200604_020807_757102_24A29FB6 
X-CRM114-Status: UNSURE (   4.84  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: maoguang.meng@mediatek.com, devicetree@vger.kernel.org,
 mojahsu@chromium.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 senozhatsky@chromium.org, sj.huang@mediatek.com, drinkcat@chromium.org,
 linux-mediatek@lists.infradead.org, Xia Jiang <xia.jiang@mediatek.com>,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patchset add support for mt2701 JPEG ENC support.

This is the compliance test result for jpeg dec and enc.

The JPEG dec log:                                           
------------------------------------------------------------
v4l2-compliance -d /dev/video0                                                  
v4l2-compliance SHA: 74377da4f5f3b63203c599d5dd75db6af91fdbb9, 32 bits, 32-bit time_t
                                                                                
Compliance test for mtk-jpeg device /dev/video0:                                
                                                                                
Driver Info:                                                                    
        Driver name      : mtk-jpeg                                             
        Card type        : mtk-jpeg decoder                                     
        Bus info         : platform:15004000.jpegdec                            
        Driver version   : 5.7.0                                                
        Capabilities     : 0x84204000                                           
                Video Memory-to-Memory Multiplanar                              
                Streaming                                                       
                Extended Pix Format                                             
                Device Capabilities                                             
        Device Caps      : 0x04204000                                           
                Video Memory-to-Memory Multiplanar                              
                Streaming                                                       
                Extended Pix Format                                             
        Detected JPEG Decoder                                                   
                                                                                
Required ioctls:                                                                
        test VIDIOC_QUERYCAP: OK                                                
                                                                                
Allow for multiple opens:                                                       
        test second /dev/video0 open: OK                                        
        test VIDIOC_QUERYCAP: OK                                                
        test VIDIOC_G/S_PRIORITY: OK                                            
        test for unlimited opens: OK                                            
                                                                                
        test invalid ioctls: OK                                                 
Debug ioctls:                                                                   
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)                        
        test VIDIOC_LOG_STATUS: OK (Not Supported)                              
                                                                                
Input ioctls:                                                                   
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)               
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)                           
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)                          
        test VIDIOC_ENUMAUDIO: OK (Not Supported)                               
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)                           
        test VIDIOC_G/S_AUDIO: OK (Not Supported)                               
        Inputs: 0 Audio Inputs: 0 Tuners: 0                                     
                                                                                
Output ioctls:                                                                  
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)                           
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)                           
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)                              
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)                          
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)                              
        Outputs: 0 Audio Outputs: 0 Modulators: 0                               
                                                                                
Input/Output configuration ioctls:                                              
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)                      
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)               
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)                          
        test VIDIOC_G/S_EDID: OK (Not Supported)                                
                                                                                
Control ioctls:                                                                 
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK                                
        test VIDIOC_QUERYCTRL: OK                                               
        test VIDIOC_G/S_CTRL: OK                                                
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK                                       
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)             
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)                            
        Standard Controls: 0 Private Controls: 0                                
                                                                                
Format ioctls:                                                                  
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK                      
        test VIDIOC_G/S_PARM: OK (Not Supported)                                
        test VIDIOC_G_FBUF: OK (Not Supported)                                  
        test VIDIOC_G_FMT: OK                                                   
        test VIDIOC_TRY_FMT: OK                                                 
        test VIDIOC_S_FMT: OK                                                   
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)                        
        test Cropping: OK (Not Supported)                                       
        test Composing: OK                                                      
        test Scaling: OK (Not Supported)                                        
                                                                                
Codec ioctls:                                                                   
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)                       
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)                             
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)                       
                                                                                
Buffer ioctls:                                                                  
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK                            
        test VIDIOC_EXPBUF: OK                                                  
        test Requests: OK (Not Supported)                                       
                                                                                
Total for mtk-jpeg device /dev/video0: 45, Succeeded: 45, Failed: 0, Warnings: 0
------------------------------------------------------------
                                                            
The JPEG enc log:                                           
                                                            
------------------------------------------------------------
v4l2-compliance -d /dev/video1                                                                     
v4l2-compliance SHA: 74377da4f5f3b63203c599d5dd75db6af91fdbb9, 32 bits, 32-bit time_t              
                                                                                                   
Compliance test for mtk-jpeg device /dev/video1:                                                   
                                                                                                   
Driver Info:                                                                                       
        Driver name      : mtk-jpeg                                                                
        Card type        : mtk-jpeg encoder                                                        
        Bus info         : platform:1500a000.jpegenc                                               
        Driver version   : 5.7.0                                                                   
        Capabilities     : 0x84204000                                                              
                Video Memory-to-Memory Multiplanar                                                 
                Streaming                                                                          
                Extended Pix Format                                                                
                Device Capabilities                                                                
        Device Caps      : 0x04204000                                                              
                Video Memory-to-Memory Multiplanar                                                 
                Streaming                                                                          
                Extended Pix Format                                                                
        Detected JPEG Encoder                                                                      
                                                                                                   
Required ioctls:                                                                                   
        test VIDIOC_QUERYCAP: OK                                                                   
                                                                                                   
Allow for multiple opens:                                                                          
        test second /dev/video1 open: OK                                                           
        test VIDIOC_QUERYCAP: OK                                                                   
        test VIDIOC_G/S_PRIORITY: OK                                                               
        test for unlimited opens: OK                                                               
                                                                                                   
        test invalid ioctls: OK                                                                    
Debug ioctls:                                                                                      
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)                                           
        test VIDIOC_LOG_STATUS: OK (Not Supported)                                                 
                                                                                                   
Input ioctls:                                                                                      
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)                                  
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)                                              
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)                                             
        test VIDIOC_ENUMAUDIO: OK (Not Supported)                                                  
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)                                              
        test VIDIOC_G/S_AUDIO: OK (Not Supported)                                                  
        Inputs: 0 Audio Inputs: 0 Tuners: 0                                                        
                                                                                                   
Output ioctls:                                                                                     
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)                                              
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)                                              
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)                                                 
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)                                             
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)                                                 
        Outputs: 0 Audio Outputs: 0 Modulators: 0                                                  
                                                                                                   
Input/Output configuration ioctls:                                                                 
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)                                         
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)                                  
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)                                             
        test VIDIOC_G/S_EDID: OK (Not Supported)                                                   
                                                                                                   
Control ioctls:                                                                                    
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK                                                   
        test VIDIOC_QUERYCTRL: OK                                                                  
        test VIDIOC_G/S_CTRL: OK                                                                   
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK                                                          
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK                                                
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)                                               
        Standard Controls: 4 Private Controls: 0                                                   
                                                                                                   
Format ioctls:                                                                                     
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK                                         
        test VIDIOC_G/S_PARM: OK (Not Supported)                                                   
        test VIDIOC_G_FBUF: OK (Not Supported)                                                     
        test VIDIOC_G_FMT: OK                                                                      
        test VIDIOC_TRY_FMT: OK                                                                    
        test VIDIOC_S_FMT: OK                                                                      
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)                                           
        test Cropping: OK                                                                          
        test Composing: OK (Not Supported)                                                         
        test Scaling: OK (Not Supported)                                                           
                                                                                                   
Codec ioctls:                                                                                      
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)                                          
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)                                                
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)                                          
                                                                                                   
Buffer ioctls:                                                                                     
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK                                               
        test VIDIOC_EXPBUF: OK                                                                     
        test Requests: OK (Not Supported)                                                          
                                                                                                   
Total for mtk-jpeg device /dev/video1: 45, Succeeded: 45, Failed: 0, Warnings: 0                   
------------------------------------------------------------

Change compared to v8:                  
-change commit message of patch 02/18                  
-use pm_runtime_put() to replace pm_runtime_put_sync() of patch 05/18              
-add one patch for deletting the resetting hardware flow in the system PM ops     
-use v4l2_m2m_suspend() and v4l2_m2m_resume() to improve the implemention         
 of the system PM ops. This patch(07/18) depends on [RFC,V4,1/4] media:           
 v4l2_mem2mem: add v4l2_m2m_suspend, v4l2_m2m_resume(https://patchwork.kernel.org/patch/11272917/)
-add one patch for cancelling the last frame handling flow                  
-add one patch for deletting zeroing the reserved fields                  
-move changing data type of max/min width/height to patch 10/18                  
-add one patch for renaming existing functions/defines/variables 

Reason for resend:
-delete check.txt in patch 06/18

Xia Jiang (18):
  media: platform: Improve subscribe event flow for bug fixing
  media: platform: Improve queue set up flow for bug fixing
  media: platform: Improve getting and requesting irq flow for bug
    fixing
  media: platform: Change the fixed device node number to unfixed value
  media: platform: Improve power on and power off flow
  media: platform: Delete the resetting hardware flow in the system PM
    ops
  media: platform: Improve the implementation of the system PM ops
  media: platform: Cancel the last frame handling flow
  media: platform: Delete zeroing the reserved fields
  media: platform: Stylistic changes for improving code quality
  media: platform: Use generic rounding helpers
  media: platform: Change MTK_JPEG_COMP_MAX macro definition location
  media: platform: Delete redundant code and add annotation for an enum
  media: dt-bindings: Add jpeg enc device tree node document
  arm: dts: mt2701: Add jpeg enc device tree node
  media: platform: Rename jpeg dec file name
  media: platform: Rename existing functions/defines/variables
  media: platform: Add jpeg enc feature

 .../bindings/media/mediatek-jpeg-encoder.txt  |   37 +
 arch/arm/boot/dts/mt2701.dtsi                 |   13 +
 drivers/media/platform/mtk-jpeg/Makefile      |    5 +-
 .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 1134 ++++++++++++-----
 .../media/platform/mtk-jpeg/mtk_jpeg_core.h   |   66 +-
 .../{mtk_jpeg_hw.c => mtk_jpeg_dec_hw.c}      |   10 +-
 .../{mtk_jpeg_hw.h => mtk_jpeg_dec_hw.h}      |   14 +-
 ...{mtk_jpeg_parse.c => mtk_jpeg_dec_parse.c} |    2 +-
 ...{mtk_jpeg_parse.h => mtk_jpeg_dec_parse.h} |    2 +-
 .../{mtk_jpeg_reg.h => mtk_jpeg_dec_reg.h}    |   19 +-
 .../media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c |  193 +++
 .../media/platform/mtk-jpeg/mtk_jpeg_enc_hw.h |  123 ++
 12 files changed, 1284 insertions(+), 334 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
 rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_hw.c => mtk_jpeg_dec_hw.c} (98%)
 rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_hw.h => mtk_jpeg_dec_hw.h} (89%)
 rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_parse.c => mtk_jpeg_dec_parse.c} (98%)
 rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_parse.h => mtk_jpeg_dec_parse.h} (92%)
 rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_reg.h => mtk_jpeg_dec_reg.h} (77%)
 create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
 create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.h

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
