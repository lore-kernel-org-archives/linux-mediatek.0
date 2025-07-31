Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 502A9C87FCA
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Jul 2025 15:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/DbdOR03CG+fHJqy+ql3n316LM1XPqyNW+BPxIMwfGU=; b=A1Avl9fDa6DJ5jIGWiaP8EXl/U
	ah4CK+pMbJPhttUsYuJ9IptBYafu/fQUChDQhZq970PEu52+Y61JfaLFw7qMzEQeNeAoESTBqc60P
	RfTPxG6W2TRoZ0lHWqMWUb9ocv90qODY3aImXiX5LEMb/Oh04FOf+JDDcptx8CeJY7j0IGXhrRDkG
	y4zYHfojRE3gXsHbiHIMojWrqkgk/ww1wV96RPyK9VLMiZEMd7OKb4CDhVI++xB7GaLu+iYp5/vur
	r+MEKHu+h9ws25XY8wxUyUfe2O8DMIFT/+7rcJhhcvnAB52uTyrsqScK5cAz+2vzbq5OjRKZoWAmu
	I/CCts0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhVJs-00000003yu1-0heF;
	Thu, 31 Jul 2025 15:35:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhVJp-00000003ytQ-2SCu
	for linux-mediatek@lists.infradead.org;
	Thu, 31 Jul 2025 15:35:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753976143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/DbdOR03CG+fHJqy+ql3n316LM1XPqyNW+BPxIMwfGU=;
	b=PJgV+ZvBg1Qlqdju44W4Qqze4eKJZBgZnafV+IIB9/Ug1FTReIQAH6/qC5eEtvWOiHdwVd
	NA01/p6vH8fl6qQ62yk+TaVePjXze44zhx9/xiBOkRDsr/bMMcVaWpxaIeSIFvWXqeTpXZ
	7EGFju5+slpDiZWdISA5SevT2+NuPu8=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-231-2I0UBwalO5WwzxV_2sW5vA-1; Thu,
 31 Jul 2025 11:34:02 -0400
X-MC-Unique: 2I0UBwalO5WwzxV_2sW5vA-1
X-Mimecast-MFC-AGG-ID: 2I0UBwalO5WwzxV_2sW5vA_1753976041
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3FAB019560AA;
	Thu, 31 Jul 2025 15:34:00 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.45.224.118])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 78B1618003FC;
	Thu, 31 Jul 2025 15:33:55 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: lorenzo@kernel.org
Cc: angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	matthias.bgg@gmail.com,
	nbd@nbd.name,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com,
	shayne.chen@mediatek.com,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: Re: [PATCH mt76 1/2] wifi: mt76: mt7996: Set def_wcid pointer in mt7996_mac_sta_init_link()
Date: Thu, 31 Jul 2025 17:33:50 +0200
Message-ID: <20250731153350.379834-1-jtornosm@redhat.com>
In-Reply-To: <20250731-mt7996-mlo-devel-v1-1-7ff4094285d0@kernel.org>
References: <20250731-mt7996-mlo-devel-v1-1-7ff4094285d0@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_083545_751174_8B144C8B 
X-CRM114-Status: UNSURE (   4.43  )
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

Tested-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>


