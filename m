Return-Path: <SRS0=O6hk=3K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F214EC33CAA
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jan 2020 09:54:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBDA820882
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jan 2020 09:54:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Mnyv3aBL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="B6yphCHo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBDA820882
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=99KI+2p6scvJE31+0ogO4TpFtmyx11/h15IddUE9p2U=; b=Mnyv3aBLJCNqY1
	3wYVoNCz4DLrMQwyJg5U72OA2WeBpxX3j2VOi6ApR+OG9i8aKUxvRagqW1ssAdVBcKpg5SutUYbOM
	dHyqH3yGRjPe+n2l3w5tVASWyQgtQWzDhcLr1DVB5RCZBs2afXhnadd6x6dvQXB+nFXlyuEszGTEL
	33q18ANXX9vlZCHaW9vRHVXGqlMNacC/UNROjIkIPgUAFwiO7gUtJq+pCaUnRbagKG/unvVZXH1tK
	jW3uyR45Xyjh4yCYCBzL2KXV1WIr2N1a1rxnCEzxI+CyOPlC5JWKa9FkbiIKF5Hez/tHjC6AC18M7
	OibuucyX5rLF4cQQo5nQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itqEP-00085z-Bm; Tue, 21 Jan 2020 09:53:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itqEC-0007wM-5K; Tue, 21 Jan 2020 09:53:46 +0000
X-UUID: 367a4403b20c46f98236c4a98ad4b451-20200121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=D0cP03HzUzwZIfc22QbOm0CXUpf0hj1ajAXoMuBX6Yg=; 
 b=B6yphCHoiQFAVdq3gCjmT5BP5ApiU5NaMufWod8EcFm75bkkR3E3D4ucN6PaceSIbKpbF5PQ/1qnAnnVjqCqoCMPS7m6OJ89ybwuU5CbmPK9ptYc0HTEDayCH654gbyaqA86wUwfchfRWjNvszVcMP3HvVZVyn12l2InBJ9K5G8=;
X-UUID: 367a4403b20c46f98236c4a98ad4b451-20200121
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xia.jiang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 24701241; Tue, 21 Jan 2020 01:53:39 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 21 Jan 2020 01:54:37 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 21 Jan 2020 17:53:03 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 21 Jan 2020 17:51:34 +0800
From: Xia Jiang <xia.jiang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab+samsung@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Rick Chang <rick.chang@mediatek.com>
Subject: [PATCH v6 0/5] Add support for mt2701 JPEG ENC support
Date: Tue, 21 Jan 2020 17:53:16 +0800
Message-ID: <20200121095320.32258-1-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200121_015344_218421_8E301AAF 
X-CRM114-Status: UNSURE (   5.11  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
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
v4l2-compliance SHA: af33cc5ef00177edbb45d466faf9061197767f2b, 32 bits            
                                                                                  
Compliance test for mtk-jpeg device /dev/video0:                                  
                                                                                  
Driver Info:                                                                      
        Driver name      : mtk-jpeg                                               
        Card type        : mtk-jpeg decoder                                       
        Bus info         : platform:15004000.jpegdec                              
        Driver version   : 5.5.0                                                  
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
        test Scaling: OK                                                          
                                                                                  
Codec ioctls:                                                                     
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)                         
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)                               
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)                         
                                                                                  
Buffer ioctls:                                                                    
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK                              
        test VIDIOC_EXPBUF: OK                                                    
        test Requests: OK (Not Supported)                                         
                                                                                  
Total for mtk-jpeg device /dev/video0: 44, Succeeded: 44, Failed: 0, Warnings: 0  
------------------------------------------------------------

The JPEG enc log:

------------------------------------------------------------
v4l2-compliance -d /dev/video1 
v4l2-compliance SHA: af33cc5ef00177edbb45d466faf9061197767f2b, 32 bits

Compliance test for mtk-jpeg device /dev/video1:

Driver Info:
        Driver name      : mtk-jpeg
        Card type        : mtk-jpeg encoder
        Bus info         : platform:1500a000.jpegenc
        Driver version   : 5.5.0
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

Total for mtk-jpeg device /dev/video1: 44, Succeeded: 44, Failed: 0, Warnings: 0
------------------------------------------------------------

Change compared to v5:
-fix checkpatch, compiler and sparse/smatch warnings.

Xia Jiang (5):
  media: platform: Fix jpeg dec driver bug and improve code quality
  media: dt-bindings: Add jpeg enc device tree node document
  arm: dts: Add jpeg enc device tree node
  media: platform: Rename jpeg dec file name
  media: platform: Add jpeg dec/enc feature

 .../bindings/media/mediatek-jpeg-encoder.txt  |  37 +
 arch/arm/boot/dts/mt2701.dtsi                 |  13 +
 drivers/media/platform/mtk-jpeg/Makefile      |   5 +-
 .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 757 +++++++++++++-----
 .../media/platform/mtk-jpeg/mtk_jpeg_core.h   |  50 +-
 .../{mtk_jpeg_hw.c => mtk_jpeg_dec_hw.c}      |  10 +-
 .../{mtk_jpeg_hw.h => mtk_jpeg_dec_hw.h}      |  14 +-
 ...{mtk_jpeg_parse.c => mtk_jpeg_dec_parse.c} |   2 +-
 ...{mtk_jpeg_parse.h => mtk_jpeg_dec_parse.h} |   2 +-
 .../{mtk_jpeg_reg.h => mtk_jpeg_dec_reg.h}    |  19 +-
 .../media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c | 273 +++++++
 .../media/platform/mtk-jpeg/mtk_jpeg_enc_hw.h |  86 ++
 .../platform/mtk-jpeg/mtk_jpeg_enc_reg.h      |  78 ++
 13 files changed, 1104 insertions(+), 242 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
 rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_hw.c => mtk_jpeg_dec_hw.c} (98%)
 rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_hw.h => mtk_jpeg_dec_hw.h} (89%)
 rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_parse.c => mtk_jpeg_dec_parse.c} (98%)
 rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_parse.h => mtk_jpeg_dec_parse.h} (92%)
 rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_reg.h => mtk_jpeg_dec_reg.h} (77%)
 create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
 create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.h
 create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_reg.h

-- 
2.18.0 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
