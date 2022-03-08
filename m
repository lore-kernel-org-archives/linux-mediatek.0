Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B41C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 11:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WPzwoSCCnb4yEJs9gFiIIVdfv3OXA9NO5opcDtzw5g0=; b=fsLkLzSPvPcrQx
	VVe8iL+bVPTp2JUPwGM4Ojguk74csPGkXrp68riuiqcvJBAzZv+367kvXoNXrEHyp2upiwHW5KzMI
	3oLOfb9A56g2kJ3Owom9DkPFe93b2fJ3ewPdq+UlglZJYtEIMyXHG2yzktJb4OY9ObZ/8w4/0j7lT
	E+i9GhuOWExaAMl5mk4Em70oS6mBEqkPCdZuaiIxF5vSWiyC8IXOaTtA7u7sm8TRsst7NXt3pFmo3
	nvrZQB8pMou4UcBhIGU91i+21j+gY0olmHFBy2CcHOCs5grc1L6STLfmnikyMALSJGh2wY+xNObmN
	YFGrsC2gKG2TU6Vsohqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRXzZ-0048nQ-5D; Tue, 08 Mar 2022 11:27:01 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRXzM-0048iN-7U; Tue, 08 Mar 2022 11:26:49 +0000
Received: by mail-wr1-x434.google.com with SMTP id u1so27952352wrg.11;
 Tue, 08 Mar 2022 03:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=dqty/TsmBq2P0dxufcWyURR/ltsPmc0+kvmHNye4yXI=;
 b=BHSaqjEm2Fc29hKVgZGSOyhtVWgV9cM97zb5nQX25Tr+TVY63J1xa6uz1HpH9Yi1qC
 y6Gv+v1bl59rRt4yN7LEvM6IY1N9Gp9PkpEL0z5C4Ul0tS1aI++Q1/TbZZ0e0O4YKAku
 JDO4xmq3sqRV+/sSjq3+EkuJteX5Xx6S143R3W/gnLJrQnxZnQTqL1LAsT1g3xmtEemm
 qxjbgg8N7X4l9r2QdQlO9V397S3KqXF/6ogJ6gk7BLIk7WkKT5K7VpBXOcRn3pIlZes2
 c08cxVKUn2FkF9nTV8nFUDEZxibMq19SujyuVaGbUGeySu93zW1HAuI94wUOKVxuFnkK
 eZYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=dqty/TsmBq2P0dxufcWyURR/ltsPmc0+kvmHNye4yXI=;
 b=FSoSR9OO/GxaXtXjTZEX6me1yeCNpZM3KGEURwjjdx0IYfd9mwhPdLdjdy592xUb6B
 vt9kvxSsKwwfD3q1/enc2kZrfGGRsUnts77WnnJF6dGnx9mhAtk8FBPqzwkE0miLIHo2
 yr8J91oIexZjMvZdvQuWDxm4zQ16G2NQlz9sTqHjKsHyIbNHWA40nPFaY6358hTwE22E
 Rpt46HQ5Q2BGQnlUDsBrAeeywnh9EM7CXvOuhh491egTcsT+ZGypnCa7mE4KJhiWYnSC
 KVBQ0wGdKuHRLq72vBUMbP1/NWvdilfxvHcUkZ2gybXffPAAZmYam3cZw7WaA6JVWjTu
 YqZQ==
X-Gm-Message-State: AOAM531EfXKLCRskYsut4szDWEhnjMUpuZWCH+/+YG3qAb40Q1MoKjkD
 GVpTk5C75BkfyNCgIrsLvw8=
X-Google-Smtp-Source: ABdhPJznvKM8N9UDgvVSyNbUsEqfibtuEC8ss6x9swDX0tUbsU7FGuqpbqsuPawzfYW+3oRNUEvsZw==
X-Received: by 2002:a5d:6b0f:0:b0:1e7:9432:ee8c with SMTP id
 v15-20020a5d6b0f000000b001e79432ee8cmr11448484wrw.216.1646738805525; 
 Tue, 08 Mar 2022 03:26:45 -0800 (PST)
Received: from felia.fritz.box
 (200116b82626c9000cc91df728b27ead.dip.versatel-1u1.de.
 [2001:16b8:2626:c900:cc9:1df7:28b2:7ead])
 by smtp.gmail.com with ESMTPSA id
 o11-20020adf9d4b000000b001f0077ea337sm14141215wre.22.2022.03.08.03.26.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 03:26:45 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>, Yunfei Dong <yunfei.dong@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: Rick Chang <rick.chang@mediatek.com>, Bin Liu <bin.liu@mediatek.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH 0/2] MAINTAINERS: minor clean-up from device-tree conversions
Date: Tue,  8 Mar 2022 12:26:28 +0100
Message-Id: <20220308112630.546-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_032648_293167_B9E2E955 
X-CRM114-Status: UNSURE (   8.52  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Mauro,

please pick these two minor non-urgent clean-up patches for your media-next tree.

Best regards,

Lukas

Lukas Bulwahn (2):
  MAINTAINERS: refurbish MEDIATEK JPEG DRIVER section
  MAINTAINERS: rectify entry for MEDIATEK MEDIA DRIVER

 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
