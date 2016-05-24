From: Henry Chen <henryc.chen@mediatek.com>
Subject: Re: [PATCH] regulator: mt6397: Constify struct regulator_ops
Date: Tue, 24 May 2016 09:33:39 +0800
Message-ID: <1464053619.18442.11.camel@mtksdaap41>
References: <1463988616-18803-1-git-send-email-henryc.chen@mediatek.com>
	 <20160523113222.GT8206@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160523113222.GT8206@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Sascha Hauer <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, eddie.huang@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

Hi Mark,

On Mon, 2016-05-23 at 12:32 +0100, Mark Brown wrote:
> On Mon, May 23, 2016 at 03:30:16PM +0800, Henry Chen wrote:
> > Consitify the structure of regulator operations.
> 
> Oh, actually the mode setting patch does apply but it depends on this
> one (which was sent after...).  It would have been better to send a
> patch series for the driver and separately a patch series for the core,
> the driver changes are orthogonal to the core ones here.

Got it. Sorry for unawareness of the dependency issue and thanks for
kindly reminder.
